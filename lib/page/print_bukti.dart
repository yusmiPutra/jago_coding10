// ignore_for_file: prefer_const_constructors

import 'dart:typed_data';
import 'package:esc_pos_bluetooth/esc_pos_bluetooth.dart';
import 'package:flutter/services.dart';
import 'package:pos_apps/res/res_get_transaksi.dart';
import 'package:pos_apps/res/res_produk_kategori.dart';
import 'package:esc_pos_utils/esc_pos_utils.dart';
import 'package:flutter/material.dart' hide Image;
import 'package:image/image.dart';
import 'package:intl/intl.dart';

class PrintBukti extends StatefulWidget {
  final ResGetTransaksi? resGetTransaksi;
  final int? counter;
  final Produk? e;
  const PrintBukti(this.resGetTransaksi, this.counter, this.e, {Key? key})
      : super(key: key);

  @override
  _PrintBuktiState createState() => _PrintBuktiState();
}

class _PrintBuktiState extends State<PrintBukti> {
  PrinterBluetoothManager printerManager = PrinterBluetoothManager();
  List<PrinterBluetooth> _device = [];

  @override
  void initState() {
    printerManager.scanResults.listen((device) {
      print('printer ${device.length}');
      setState(() {
        _device = device;
      });
    });
    super.initState();
  }

  void _startScandDevice() {
    setState(() {
      _device = [];
    });
    printerManager.startScan(Duration(seconds: 5));
  }

  void _stopScanDevice() {
    printerManager.stopScan();
  }

  Future<void> demoReceipt(PrinterBluetooth printerB) async {
    printerManager.selectPrinter(printerB);
    final profile = await CapabilityProfile.load();
    final generator = Generator(PaperSize.mm80, profile);
    List<int> bytes = [];

    final ByteData data = await rootBundle.load("assets/Frame.jpg");
    final Uint8List gambarBytes = data.buffer.asUint8List();
    final Image? image = decodeImage(gambarBytes);

    bytes += generator.image(image!);

    bytes += generator.text('UDACODING POS',
        styles: PosStyles(
          align: PosAlign.center,
          height: PosTextSize.size2,
        ),
        linesAfter: 1);

    bytes +=
        generator.text('Udacoding', styles: PosStyles(align: PosAlign.center));
    bytes += generator.text('PT. Udacoding',
        styles: PosStyles(align: PosAlign.center));
    bytes += generator.text('Telp: 0822-1376-1973',
        styles: PosStyles(align: PosAlign.center));
    bytes += generator.text('Web: https://www.udacoding.com',
        styles: PosStyles(align: PosAlign.center), linesAfter: 1);

    bytes += generator.hr(len: 42);

    bytes += generator.row([
      PosColumn(text: 'Qty', width: 2),
      PosColumn(text: 'Item', width: 2),
      PosColumn(text: 'Price', width: 2),
      PosColumn(text: 'Total', width: 6)
    ]);

    bytes += generator.row([
      PosColumn(text: '${widget.counter}', width: 2),
      PosColumn(text: '${widget.e?.productName}', width: 2),
      PosColumn(text: '${widget.e?.productPrice}', width: 2),
      PosColumn(text: '${widget.resGetTransaksi?.data?.totalPrice}', width: 6)
    ]);

    bytes += generator.hr(len: 42);

    bytes += generator.row([
      PosColumn(
          text: 'Total',
          width: 3,
          styles:
              PosStyles(height: PosTextSize.size2, width: PosTextSize.size2)),
      PosColumn(text: '', width: 3),
      PosColumn(text: '', width: 3),
      PosColumn(
          text: '${widget.resGetTransaksi?.data?.totalPrice}',
          width: 3,
          styles: PosStyles(align: PosAlign.right, height: PosTextSize.size2))
    ]);

    bytes += generator.hr(ch: "=", linesAfter: 1, len: 42);

    bytes += generator.row([
      PosColumn(
          text: 'Cash    ',
          width: 3,
          styles: PosStyles(align: PosAlign.left, width: PosTextSize.size2)),
      PosColumn(text: '', width: 3),
      PosColumn(text: '', width: 3),
      PosColumn(
          text: '${widget.resGetTransaksi?.data?.totalPrice}',
          width: 3,
          styles: PosStyles(align: PosAlign.right, width: PosTextSize.size2))
    ]);

    bytes += generator.row([
      PosColumn(
          text: 'Change    ',
          width: 3,
          styles: PosStyles(align: PosAlign.left, width: PosTextSize.size2)),
      PosColumn(text: '', width: 3),
      PosColumn(text: '', width: 3),
      PosColumn(
          text: '${widget.resGetTransaksi?.data?.totalPrice}',
          width: 3,
          styles: PosStyles(align: PosAlign.right, width: PosTextSize.size2))
    ]);

    bytes += generator.feed(2);

    bytes += generator.text(
      'Thank you!\nSudah berbelanja di Udacoding',
      styles: PosStyles(align: PosAlign.center, bold: true),
    );

    final now = DateTime.now();
    final formatter = DateFormat('MM/dd/yyyy H:m');
    final String timeStamp = formatter.format(now);
    bytes += generator.text(timeStamp,
        styles: PosStyles(align: PosAlign.center), linesAfter: 2);
    bytes += generator.cut();
    printerManager.printTicket(bytes);
  }

  void _testPrint(PrinterBluetooth printer) async {
    await demoReceipt(printer);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Printer'),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
          itemCount: _device.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () => _testPrint(_device[index]),
              title: Text('${_device[index].name}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${_device[index].address}'),
                  Text('Klik to print a test receipt')
                ],
              ),
            );
          }),
      floatingActionButton: StreamBuilder<bool>(
          stream: printerManager.isScanningStream,
          initialData: false,
          builder: (context, snapshot) {
            if (snapshot.data == true) {
              return FloatingActionButton(
                child: Icon(Icons.stop),
                onPressed: _stopScanDevice,
                backgroundColor: Colors.red,
              );
            } else {
              return FloatingActionButton(
                child: Icon(Icons.search),
                onPressed: _startScandDevice,
                backgroundColor: Colors.green,
              );
            }
          }),
    );
  }
}

// ignore_for_file: prefer_const_constructors

import 'package:esc_pos_bluetooth/esc_pos_bluetooth.dart';
import 'package:flutter/material.dart';
import 'package:pos_apps/res/res_get_transaksi.dart';

class PrintBukti extends StatefulWidget {
  final ResGetTransaksi? resGetTransaksi;
  const PrintBukti(this.resGetTransaksi, {Key? key}) : super(key: key);

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
              // onTap: () => ,
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
              );
            }
          }),
    );
  }
}

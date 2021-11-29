// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pos_apps/page/print_bukti.dart';
import 'package:pos_apps/res/res_get_transaksi.dart';
import 'package:pos_apps/res/res_produk_kategori.dart';

class PrintStruct extends StatefulWidget {
  final ResGetTransaksi? resGetTransaksi;
  final int? counter;
  final Produk? e;
  PrintStruct(this.resGetTransaksi, this.counter, this.e);

  @override
  _PrintStructState createState() => _PrintStructState();
}

class _PrintStructState extends State<PrintStruct> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: Column(
        children: [
          Container(
            height: 25,
            alignment: Alignment.center,
            width: 50,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Divider(
                    thickness: 2,
                    color: Colors.grey.withOpacity(0.5),
                    height: 2,
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Divider(
                    thickness: 2,
                    color: Colors.grey.withOpacity(0.5),
                    height: 2,
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 32),
            alignment: Alignment.centerLeft,
            child: Text(
              'Print Transaksi ?',
              style: TextStyle(
                color: Colors.green,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
            child: MaterialButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => PrintBukti(
                            widget.resGetTransaksi, widget.counter, widget.e)));
              },
              color: Colors.green,
              textColor: Colors.white,
              child: Text('Print'),
            ),
          )
        ],
      ),
    );
  }
}

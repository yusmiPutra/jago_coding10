// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_apps/cubit/customer/customer_cubit.dart';
import 'package:pos_apps/cubit/transaksi/transaksi_cubit.dart';
import 'package:pos_apps/page/bottom_sheet_option.dart';
import 'package:pos_apps/res/res_get_customer.dart';

class CompleteTransaksi extends StatefulWidget {
  final double? totalItem;
  final int? idProduct;
  final int? counter;
  final double? productPrice;

  CompleteTransaksi(
      this.totalItem, this.idProduct, this.counter, this.productPrice);

  @override
  _CompleteTransaksiState createState() => _CompleteTransaksiState();
}

class _CompleteTransaksiState extends State<CompleteTransaksi> {
  TextEditingController nama = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController note = TextEditingController();
  bool isCari = true;
  TextEditingController cari = TextEditingController();
  List<DataCustomer> filterData = [];
  int? idCustomer;

  TransaksiCubit? cubitTransaksi;

  _CompleteTransaksiState() {
    cari.addListener(() {
      if (cari.text.isEmpty) {
        setState(() {
          isCari = false;
        });
      } else {
        setState(() {
          isCari = true;
        });
      }
    });
  }

  CustomerCubit? cubit;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CustomerCubit>(create: (context) => CustomerCubit()),
        BlocProvider<TransaksiCubit>(create: (context) => TransaksiCubit())
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text('Komplete Transaksi'),
          backgroundColor: Colors.green,
        ),
        body: BlocBuilder<CustomerCubit, CustomerState>(
          builder: (context, state) {
            cubit = context.read<CustomerCubit>();
            if (state is CustomerInitial) {
              cubit?.showCustomer();
            }
            if (state is CustomerSuccess) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: cari,
                        decoration: InputDecoration(
                            hintText: 'Cari Customer',
                            prefixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                      isCari == false
                          ? Container()
                          : Container(
                              height: 200,
                              child: performSearchData(),
                            ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Data Customer',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text('Nama'),
                      SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        controller: nama,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 8),
                            hintText: 'NAMA',
                            filled: true,
                            fillColor: Colors.grey.withOpacity(0.2),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none)),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text('Phone Number'),
                      SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        controller: phone,
                        decoration: InputDecoration(
                            hintText: 'Phone',
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 8),
                            filled: true,
                            fillColor: Colors.grey.withOpacity(0.2),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10))),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text('Note'),
                      SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        maxLines: 3,
                        controller: note,
                        decoration: InputDecoration(
                            hintText: 'NOTE',
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10)),
                            filled: true,
                            fillColor: Colors.grey.withOpacity(0.2),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 8)),
                      )
                    ],
                  ),
                ),
              );
            }
            return Container();
          },
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            alignment: Alignment.center,
            height: 116,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Pembayaran',
                        style: TextStyle(color: Colors.green, fontSize: 16),
                      ),
                      Text(
                        'RM. ${widget.totalItem}',
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: BlocBuilder<TransaksiCubit, TransaksiState>(
                    builder: (context, state) {
                      cubitTransaksi = context.read<TransaksiCubit>();
                      if (state is TransaksiLoading) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return MaterialButton(
                        minWidth: MediaQuery.of(context).size.width,
                        color: Colors.green,
                        height: 65,
                        textColor: Colors.white,
                        onPressed: () async {
                          await cubitTransaksi
                              ?.transaksi(
                                  context,
                                  idCustomer,
                                  note.text,
                                  widget.totalItem,
                                  widget.idProduct,
                                  widget.counter,
                                  widget.productPrice)
                              .then((value) async {
                            await showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return PrintStruct(
                                      cubitTransaksi?.resGetTransaksi);
                                });
                          });
                        },
                        child: Text('Complete Payment'),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget performSearchData() {
    filterData = [];
    for (int i = 0; i < (cubit?.resGetCustomer?.data?.length ?? 0); i++) {
      var item = cubit?.resGetCustomer?.data?[i];
      if (item?.customerName?.toLowerCase().contains(cari.text.toLowerCase()) ==
          true) {
        filterData.add(item!);
      }
    }
    return resultData();
  }

  Widget resultData() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: filterData.length,
        itemBuilder: (context, index) {
          DataCustomer data = filterData[index];
          return ListTile(
            title: Text('${data.customerName}'),
            subtitle: Text('${data.customerTelp}'),
            onTap: () {
              nama.text = data.customerName!;
              phone.text = data.customerTelp!;
              cari.text = data.customerName!;
              idCustomer = data.idCustomer!;
              setState(() {
                isCari = false;
              });
            },
          );
        });
  }
}

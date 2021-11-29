import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:pos_apps/page/main_menu.dart';
import 'package:pos_apps/repository/repo_transaksi.dart';
import 'package:pos_apps/res/res_get_transaksi.dart';

part 'transaksi_state.dart';

class TransaksiCubit extends Cubit<TransaksiState> {
  TransaksiCubit() : super(TransaksiInitial());

  RepoTransaksi repo = RepoTransaksi();
  ResGetTransaksi? resGetTransaksi;

  Future<void> transaksi(BuildContext context, int? idCustomer, String? note,
      double? totalPrice, int? idProduk, int? qty, double? itemPrice) async {
    try {
      emit(TransaksiLoading());
      ResGetTransaksi? res = await repo.transaksiCeckout(
          idCustomer, note, totalPrice, idProduk, qty, itemPrice);
      if (res?.success == true) {
        resGetTransaksi = res;
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (_) => MainMenu()), (route) => false);
        emit(TransaksiSuccess(resGetTransaksi));
      } else {
        emit(TransaksiFailed("Transaksi Gagal"));
      }
    } catch (e) {
      log('${e.toString()}');
    }
  }
}

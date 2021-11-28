import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pos_apps/data_global.dart';
import 'package:pos_apps/network/api.dart';
import 'package:pos_apps/res/res_get_transaksi.dart';

class RepoTransaksi {
  Dio dio = Dio();
  Future<ResGetTransaksi?> transaksiCeckout(int? idCustomer, String? note,
      double? totalPrice, int? idProduk, int? qty, double? itemPrice) async {
    try {
      Response res = await dio.post(transaksicekout,
          data: FormData.fromMap({
            'id_user': '${dataGlobal.user?.user?.idUser}',
            'id_customer': '$idCustomer',
            'transaction_none': '$note',
            'total_price': '$totalPrice',
            'latitude': 0.0,
            'longitude': 0.0,
            'item_product[0]': '$idProduk',
            'item_qty[0]': '$qty',
            'item_price[0]': '$itemPrice',
            'payment_method': 'CASH',
            'is_quotation': 'false'
          }));
      return ResGetTransaksi.fromJson(res.data);
    } catch (e) {
      log('${e.toString()}');
    }
  }
}

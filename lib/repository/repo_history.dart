import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pos_apps/data_global.dart';
import 'package:pos_apps/network/api.dart';
import 'package:pos_apps/res/res_get_history.dart';

class RepoHistory {
  Dio dio = Dio();
  Future<ResGetTHistoryOrder?> getHistory() async {
    try {
      Response res = await dio.post(history_order, data: {
        'payment_method': 'CASH',
        'id_user': dataGlobal.user?.user?.idUser
      });
      return ResGetTHistoryOrder.fromJson(res.data);
    } catch (e) {
      log('${e.toString()}');
    }
  }
}

import 'package:dio/dio.dart';
import 'package:pos_apps/network/api.dart';
import 'package:pos_apps/res/res_get_customer.dart';

class RepoCustomer {
  Dio dio = Dio();
  Future showListCustomer() async {
    try {
      Response res = await dio.post(getListCustomer);
      return ResGetCustomer.fromJson(res.data);
    } catch (e) {
      print(e.toString());
    }
  }
}

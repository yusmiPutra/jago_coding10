import 'package:dio/dio.dart';
import 'package:pos_apps/data_global.dart';
import 'package:pos_apps/network/api.dart';
import 'package:pos_apps/res/res_get_profile.dart';

class RepoUser {
  Dio dio = Dio();
  Future<ResGetProfile?> getDataUser() async {
    try {
      Response res = await dio
          .post(data_user, data: {'id_user': dataGlobal.user?.user?.idUser});
      return ResGetProfile.fromJson(res.data);
    } catch (e) {}
  }
}

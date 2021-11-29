import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pos_apps/repository/repo_user.dart';
import 'package:pos_apps/res/res_get_profile.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  RepoUser repo = RepoUser();
  ResGetProfile? resGetProfile;

  Future<void> getUserData() async {
    try {
      emit(UserLoading());
      ResGetProfile? res = await repo.getDataUser();
      if (res != null) {
        resGetProfile = res;
        emit(UserSuccess(resGetProfile));
      } else {
        print(res?.success ?? "");
      }
    } catch (e) {
      log('${e.toString()}');
      emit(UserFailed(e.toString()));
    }
  }
}

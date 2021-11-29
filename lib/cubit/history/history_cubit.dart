import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pos_apps/repository/repo_history.dart';
import 'package:pos_apps/res/res_get_history.dart';

part 'history_state.dart';

class HistoryCubit extends Cubit<HistoryState> {
  HistoryCubit() : super(HistoryInitial());

  RepoHistory repo = RepoHistory();
  ResGetTHistoryOrder? resGetTHistoryOrder;

  Future<void> getHistoryOrder() async {
    try {
      emit(HistoryLoading());
      ResGetTHistoryOrder? res = await repo.getHistory();
      if (res != null) {
        resGetTHistoryOrder = res;
        emit(HistorySuccess(resGetTHistoryOrder));
      } else {
        print(res?.message ?? "");
      }
    } catch (e) {
      log('${e.toString()}');
      emit(HistoryFailed(e.toString()));
    }
  }
}

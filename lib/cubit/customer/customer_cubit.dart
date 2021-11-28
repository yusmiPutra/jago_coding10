import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pos_apps/repository/repo_customer.dart';
import 'package:pos_apps/res/res_get_customer.dart';

part 'customer_state.dart';

class CustomerCubit extends Cubit<CustomerState> {
  CustomerCubit() : super(CustomerInitial());

  RepoCustomer repo = RepoCustomer();
  ResGetCustomer? resGetCustomer;

  Future<void> showCustomer() async {
    try {
      emit(CustomerLoading());
      ResGetCustomer? res = await repo.showListCustomer();
      if (res != null) {
        resGetCustomer = res;
        emit(CustomerSuccess(resGetCustomer));
      } else {
        log('${res?.success}');
      }
    } catch (e, st) {
      log('$st');
    }
  }
}

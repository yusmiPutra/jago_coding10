part of 'customer_cubit.dart';

@immutable
abstract class CustomerState {}

class CustomerInitial extends CustomerState {}

class CustomerLoading extends CustomerState {}

class CustomerSuccess extends CustomerState {
  final ResGetCustomer? resGetCustomer;
  CustomerSuccess(this.resGetCustomer);
}

class CustomerFailed extends CustomerState {
  final String? message;
  CustomerFailed(this.message);
}

class CustomerError extends CustomerState {
  final String? message;
  CustomerError(this.message);
}

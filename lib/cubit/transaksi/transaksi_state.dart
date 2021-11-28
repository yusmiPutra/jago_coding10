part of 'transaksi_cubit.dart';

@immutable
abstract class TransaksiState {}

class TransaksiInitial extends TransaksiState {}

class TransaksiLoading extends TransaksiState {}

class TransaksiSuccess extends TransaksiState {
  final ResGetTransaksi? resGetTransaksi;
  TransaksiSuccess(this.resGetTransaksi);
}

class TransaksiFailed extends TransaksiState {
  final String? message;
  TransaksiFailed(this.message);
}

class TransaksiError extends TransaksiState {
  final String? message;
  TransaksiError(this.message);
}

part of 'history_cubit.dart';

@immutable
abstract class HistoryState {}

class HistoryInitial extends HistoryState {}

class HistoryLoading extends HistoryState {}

class HistorySuccess extends HistoryState {
  final ResGetTHistoryOrder? resGetTHistoryOrder;
  HistorySuccess(this.resGetTHistoryOrder);
}

class HistoryFailed extends HistoryState {
  final String message;
  HistoryFailed(this.message);
}

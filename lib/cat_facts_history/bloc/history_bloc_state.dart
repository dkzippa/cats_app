part of 'history_bloc.dart';

abstract class HistoryBlocState extends Equatable {
  const HistoryBlocState();

  @override
  List<Object> get props => [];
}

class HistoryBlocInitial extends HistoryBlocState {}

class HistoryBlocLoading extends HistoryBlocState {}

class HistoryBlocLoaded extends HistoryBlocState {
  final List<HistoryRecord> records;

  const HistoryBlocLoaded({required this.records});
  @override
  List<Object> get props => [records];
}

class HistoryBlocError extends HistoryBlocState {
  final Error error;
  const HistoryBlocError({required this.error});

  @override
  List<Object> get props => [error];
}

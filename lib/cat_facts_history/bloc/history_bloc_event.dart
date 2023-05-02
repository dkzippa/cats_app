part of 'history_bloc.dart';

abstract class HistoryBlocEvent extends Equatable {
  const HistoryBlocEvent();

  @override
  List<Object> get props => [];
}

class HistoryBlocEventLoad extends HistoryBlocEvent {}

class HistoryBlocEventAdd extends HistoryBlocEvent {
  final HistoryRecord record;

  const HistoryBlocEventAdd({required this.record});

  @override
  List<Object> get props => [record];
}

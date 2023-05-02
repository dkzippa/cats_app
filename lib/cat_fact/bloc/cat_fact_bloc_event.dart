part of 'cat_fact_bloc.dart';

abstract class CatFactBlocEvent extends Equatable {
  const CatFactBlocEvent();

  @override
  List<Object> get props => [];
}

class CatFactBlocEventLoad extends CatFactBlocEvent {}

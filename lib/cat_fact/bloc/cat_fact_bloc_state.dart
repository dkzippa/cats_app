part of 'cat_fact_bloc.dart';

abstract class CatFactBlocState extends Equatable {
  const CatFactBlocState();

  @override
  List<Object> get props => [];
}

class CatFactBlocInitial extends CatFactBlocState {}

class CatFactStateFactLoading extends CatFactBlocState {}

class CatFactStateFactLoaded extends CatFactBlocState {
  final CatFact fact;
  final String imgUrl;

  const CatFactStateFactLoaded({
    required this.fact,
    required this.imgUrl,
  });

  @override
  List<Object> get props => [fact, imgUrl];
}

class CatFactStateError extends CatFactBlocState {
  final Error error;
  const CatFactStateError({required this.error});

  @override
  List<Object> get props => [error];
}

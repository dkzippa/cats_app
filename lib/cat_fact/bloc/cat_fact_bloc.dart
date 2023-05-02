import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:proarea_catsapp/cat_fact/data/cat_fact_repo.dart';
import 'package:proarea_catsapp/cat_fact/data/cat_image_repo.dart';
import 'package:proarea_catsapp/cat_fact/data/model/cat_fact.dart';
import 'package:proarea_catsapp/cat_fact/data/model/cat_image.dart';
import 'package:proarea_catsapp/cat_facts_history/data/history_repo.dart';
import 'package:proarea_catsapp/cat_facts_history/data/model/history_record.dart';
import 'package:proarea_catsapp/config/app_strings.dart';

part 'cat_fact_bloc_event.dart';
part 'cat_fact_bloc_state.dart';

class CatFactBloc extends Bloc<CatFactBlocEvent, CatFactBlocState> {
  final CatFactRepo factClient;
  final CatImageRepo imageClient;
  final HistoryRepo historyService;

  CatFactBloc({
    required this.factClient,
    required this.imageClient,
    required this.historyService,
  }) : super(CatFactBlocInitial()) {
    on<CatFactBlocEventLoad>((event, emit) async {
      emit(CatFactStateFactLoading());

      try {
        final fact = await factClient.getCatFact();

        final List<CatImage> images = await imageClient.getCatImage();
        final catImgUrl = images[0].url;

        await factClient.getCatFact();

        final historyRecord = HistoryRecord(text: fact.text, createdAt: fact.createdAt);
        historyService.addRecord(historyRecord);

        emit(CatFactStateFactLoaded(fact: fact, imgUrl: catImgUrl));
      } catch (e) {
        Logger().e(e);
        emit(CatFactStateError(
          error: StateError(AppStrings.loadingErrorContent),
        ));
      }
    });
  }
}

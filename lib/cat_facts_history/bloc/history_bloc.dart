import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:proarea_catsapp/cat_facts_history/data/history_repo.dart';
import 'package:proarea_catsapp/cat_facts_history/data/model/history_record.dart';
import 'package:proarea_catsapp/config/app_strings.dart';

part 'history_bloc_event.dart';
part 'history_bloc_state.dart';

class HistoryBloc extends Bloc<HistoryBlocEvent, HistoryBlocState> {
  final HistoryRepo historyService;
  HistoryBloc({required this.historyService}) : super(HistoryBlocInitial()) {
    on<HistoryBlocEventAdd>((event, emit) async {
      try {
        final factHistoryRecord = HistoryRecord(text: event.record.text, createdAt: event.record.createdAt);
        await historyService.addRecord(factHistoryRecord);
      } catch (e) {
        Logger().e(e);
      }
    });

    on<HistoryBlocEventLoad>((event, emit) async {
      emit(HistoryBlocLoading());

      try {
        final List<HistoryRecord> records = await historyService.readRecords();
        emit(HistoryBlocLoaded(records: records));
      } catch (e) {
        Logger().e(e);
        emit(HistoryBlocError(
          error: StateError(AppStrings.loadingErrorContent),
        ));
      }
    });
  }
}

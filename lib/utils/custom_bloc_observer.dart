import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

class CustomBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    Logger().d(event);
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    Logger().d(transition);
    super.onTransition(bloc, transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    Logger().e(error);
    super.onError(bloc, error, stackTrace);
  }
}

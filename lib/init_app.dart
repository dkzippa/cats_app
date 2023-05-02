import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:proarea_catsapp/cat_fact/data/cat_fact_repo.dart';
import 'package:proarea_catsapp/cat_fact/data/cat_image_repo.dart';
import 'package:proarea_catsapp/cat_facts_history/data/history_repo.dart';
import 'package:proarea_catsapp/cat_facts_history/data/model/history_record.dart';
import 'package:proarea_catsapp/config/app_config.dart' as config;
import 'package:proarea_catsapp/config/app_themes.dart';
import 'package:proarea_catsapp/utils/custom_bloc_observer.dart';

Future<void> initApp() async {
  if (kDebugMode) {
    Bloc.observer = CustomBlocObserver();
    CachedNetworkImage.logLevel = CacheManagerLogLevel.debug;
  }

  initializeDateFormatting();

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark.copyWith(statusBarColor: ThemeColors.primary),
  );

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  final dio = Dio();
  GetIt.I.registerSingleton<CatFactRepo>(CatFactRepo(dio));
  GetIt.I.registerSingleton<CatImageRepo>(CatImageRepo(dio));
  GetIt.I.registerSingleton<HistoryRepo>(HistoryRepo());

  await Hive.initFlutter();
  Hive.registerAdapter(HistoryRecordAdapter());

  // for testing purposes only:
  final box = await Hive.openBox(config.hiveCollectionName);
  await box.compact();
  await box.clear();
  box.close();
}

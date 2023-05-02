import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:proarea_catsapp/cat_fact/bloc/cat_fact_bloc.dart';
import 'package:proarea_catsapp/cat_fact/ui/cat_fact_page.dart';
import 'package:proarea_catsapp/cat_fact/data/cat_fact_repo.dart';
import 'package:proarea_catsapp/cat_fact/data/cat_image_repo.dart';
import 'package:proarea_catsapp/cat_facts_history/bloc/history_bloc.dart';
import 'package:proarea_catsapp/cat_facts_history/data/history_repo.dart';
import 'package:proarea_catsapp/config/app_strings.dart';
import 'package:proarea_catsapp/config/app_themes.dart';

class CatApp extends StatelessWidget {
  const CatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => CatFactBloc(
            factClient: GetIt.I<CatFactRepo>(),
            imageClient: GetIt.I<CatImageRepo>(),
            historyService: GetIt.I<HistoryRepo>(),
          )..add(CatFactBlocEventLoad()),
        ),
        BlocProvider(
          create: (context) => HistoryBloc(
            historyService: GetIt.I<HistoryRepo>(),
          ),
        ),
      ],
      child: MaterialApp(
        title: AppStrings.appTitle,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ThemeData().colorScheme.copyWith(
                primary: ThemeColors.primary,
                secondary: ThemeColors.primaryLight,
              ),
        ),
        home: const CatFactPage(),
      ),
    );
  }
}

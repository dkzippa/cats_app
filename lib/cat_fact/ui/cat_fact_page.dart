import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:proarea_catsapp/cat_fact/bloc/cat_fact_bloc.dart';
import 'package:proarea_catsapp/cat_fact/ui/widgets/appbar_leading_btn.dart';
import 'package:proarea_catsapp/cat_fact/ui/widgets/cat_fact_page_content.dart';
import 'package:proarea_catsapp/common/widgets/loading_error.dart';
import 'package:proarea_catsapp/config/app_strings.dart';
import 'package:proarea_catsapp/config/app_dimensions.dart';

import 'package:sprintf/sprintf.dart';

class CatFactPage extends StatefulWidget {
  const CatFactPage({super.key});

  @override
  State<CatFactPage> createState() => _CatFactPageState();
}

class _CatFactPageState extends State<CatFactPage> {
  @override
  void initState() {
    FlutterNativeSplash.remove();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.pageCatFactTitle),
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        elevation: 0.0,
        leading: const AppbarLeadingBtn(),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppDimensions.globalPadding),
          child: Center(
            child: BlocBuilder<CatFactBloc, CatFactBlocState>(
              builder: (context, state) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (state is CatFactStateFactLoaded) ...[
                      CatFactPageContent(state: state)
                    ] else if (state is CatFactStateError) ...[
                      LoadingError(errorText: sprintf(AppStrings.uiLoadingError, state.error))
                    ] else ...[
                      const CircularProgressIndicator()
                    ],
                    ElevatedButton(
                      onPressed: (state is CatFactStateFactLoaded) ? () => handleLoadNewFact() : null,
                      child: const Text(AppStrings.btnLoadAnotherFact),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  handleLoadNewFact() {
    BlocProvider.of<CatFactBloc>(context).add(CatFactBlocEventLoad());
  }
}

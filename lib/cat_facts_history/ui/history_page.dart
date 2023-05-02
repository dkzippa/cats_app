import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:proarea_catsapp/cat_facts_history/bloc/history_bloc.dart';
import 'package:proarea_catsapp/common/widgets/cat_loader.dart';
import 'package:proarea_catsapp/common/widgets/loading_error.dart';
import 'package:proarea_catsapp/config/app_strings.dart';
import 'package:proarea_catsapp/config/app_dimensions.dart';
import 'package:proarea_catsapp/config/app_themes.dart';
import 'package:proarea_catsapp/utils/date_utils.dart' as date_utils;
import 'package:sprintf/sprintf.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  void initState() {
    BlocProvider.of<HistoryBloc>(context).add(HistoryBlocEventLoad());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.pageHistoryTitle),
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppDimensions.globalPadding),
          child: Center(
            child: BlocBuilder<HistoryBloc, HistoryBlocState>(
              builder: (context, state) {
                if (state is HistoryBlocLoaded) {
                  return ListView.builder(
                    itemCount: state.records.length,
                    itemBuilder: (context, listIndex) {
                      return buildListItem(context, listIndex, state.records);
                    },
                  );
                } else if (state is HistoryBlocError) {
                  return LoadingError(errorText: sprintf(AppStrings.uiLoadingError, state.error));
                }
                return const CatLoader();
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget buildListItem(context, listIndex, records) {
    final record = records[listIndex];
    final dateFormatted = date_utils.formatDateIntl(record.createdAt, context);

    return ListTile(
      title: Text(
        record.text,
        style: ThemeStyles.header14,
      ),
      subtitle: Text(dateFormatted),
      trailing: const FaIcon(FontAwesomeIcons.cat),
    );
  }
}

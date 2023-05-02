import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:proarea_catsapp/cat_fact/bloc/cat_fact_bloc.dart';
import 'package:proarea_catsapp/common/widgets/cat_loader.dart';
import 'package:proarea_catsapp/common/widgets/loading_error.dart';
import 'package:proarea_catsapp/config/app_strings.dart';
import 'package:proarea_catsapp/config/app_dimensions.dart';
import 'package:proarea_catsapp/config/app_themes.dart';
import 'package:proarea_catsapp/utils/date_utils.dart' as date_utils;

class CatFactPageContent extends StatelessWidget {
  final CatFactStateFactLoaded state;

  const CatFactPageContent({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final dateFormatted = date_utils.formatDateIntl(state.fact.createdAt, context);
    final imgHeight = MediaQuery.of(context).size.width * AppDimensions.imgHeightRatio;

    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(AppDimensions.imagePadding),
              child: CachedNetworkImage(
                imageUrl: state.imgUrl,
                height: imgHeight,
                progressIndicatorBuilder: (context, url, progress) => const CatLoader(),
                errorWidget: (context, url, error) => const LoadingError(
                  errorText: AppStrings.uiLoadingImageError,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppDimensions.subheaderPadding),
              child: Text(
                state.fact.text,
                textAlign: TextAlign.center,
                style: ThemeStyles.header14,
              ),
            ),
            Text(dateFormatted, style: ThemeStyles.subheader),
          ],
        ),
      ),
    );
  }
}

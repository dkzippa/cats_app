import 'package:dio/dio.dart';
import 'package:proarea_catsapp/cat_fact/data/model/cat_image.dart';
import 'package:proarea_catsapp/config/app_config.dart' as config;
import 'package:retrofit/retrofit.dart';

part 'cat_image_repo.g.dart';

@RestApi(baseUrl: config.catImageApiUrl)
abstract class CatImageRepo {
  factory CatImageRepo(Dio dio, {String baseUrl}) = _CatImageRepo;

  @GET('/images/search?limit=1')
  Future<List<CatImage>> getCatImage();
}

import 'package:dio/dio.dart';
import 'package:proarea_catsapp/cat_fact/data/model/cat_fact.dart';
import 'package:proarea_catsapp/config/app_config.dart' as config;
import 'package:retrofit/retrofit.dart';

part 'cat_fact_repo.g.dart';

@RestApi(baseUrl: config.catFactApiUrl)
abstract class CatFactRepo {
  factory CatFactRepo(Dio dio, {String baseUrl}) = _CatFactRepo;

  @GET('/facts/random')
  Future<CatFact> getCatFact();
}

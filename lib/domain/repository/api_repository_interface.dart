import 'package:movie_app/domain/response/response_generic.dart';

abstract class ApiRepositoryInterface {
  Future<ResponseGeneric> getTopRated();
  Future<ResponseGeneric> getRecommended();
  Future<ResponseGeneric> getMovie(String idMovie);
}

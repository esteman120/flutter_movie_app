import 'package:movie_app/data/datasource/api_movies.dart';
import 'package:movie_app/domain/repository/api_repository_interface.dart';
import 'package:movie_app/domain/response/response_generic.dart';

class ApiRepositoryImpl extends ApiRepositoryInterface {
  final ApiMovies _apiLogin = ApiMovies();

  @override
  Future<ResponseGeneric> getTopRated() async {
    var response = await _apiLogin.getTopRated();
    if (!response.isOk) {
      return ResponseGeneric(success: false);
    }
    return ResponseGeneric(success: true, data: response.body);
  }

  @override
  Future<ResponseGeneric> getRecommended() async {
    var response = await _apiLogin.getRecommended();
    if (!response.isOk) {
      return ResponseGeneric(success: false);
    }
    return ResponseGeneric(success: true, data: response.body);
  }

  @override
  Future<ResponseGeneric> getMovie(String idMovie) async {
    var response = await _apiLogin.getMovie(idMovie);
    if (!response.isOk) {
      return ResponseGeneric(success: false);
    }
    return ResponseGeneric(success: true, data: response.body);
  }
}

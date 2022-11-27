import 'package:get/get.dart';
import 'package:movie_app/domain/config/app_configuration.dart';

class ApiMovies extends GetConnect {
  String? host;
  String? api;
  String? apiToken;
  ApiMovies() {
    api = "/";
    apiToken = AppConfiguration.token.toString();
    host = AppConfiguration.urlApi.toString();
    httpClient.timeout = const Duration(seconds: 10);
  }

  Future<Map<String, String>> getHeaders(bool hasAuthorization) async {
    var headers = <String, String>{};
    if (hasAuthorization) {
      headers = {'Authorization': 'Bearer $apiToken'};
    }

    return headers;
  }

  Future<Response> getTopRated() async {
    var headers = await getHeaders(true);
    var url = host.toString() + '/top_rated';
    var response = await get(url, headers: headers);
    return response;
  }

  Future<Response> getRecommended() async {
    var headers = await getHeaders(true);
    var url = host.toString() + '/popular';
    var response = await get(url, headers: headers);
    return response;
  }

  Future<Response> getMovie(String idMovie) async {
    var headers = await getHeaders(true);
    var url = host.toString() + '/$idMovie';
    var response = await get(url, headers: headers);
    return response;
  }
}

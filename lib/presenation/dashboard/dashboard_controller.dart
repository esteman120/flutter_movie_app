import 'dart:convert';
import 'package:get/get.dart';
import 'package:movie_app/domain/repository/api_repository_interface.dart';
import 'package:movie_app/domain/response/list_movies_rate.dart';
import 'package:movie_app/domain/response/movie.dart';
import 'package:movie_app/domain/utils/state_loading.dart';

// ignore: slash_for_doc_comments
/**
* Controlador de la vista de dashboar, hace una carga inicial con las peliculas recomendadas y el top rated
* @author: EB
* @version: v1.0.0  
* @created: 27/11/2022
* @update: 
*/
class DashboardController extends GetxController {
  final ApiRepositoryInterface apiRepositoryInterface;

  DashboardController(this.apiRepositoryInterface);

  var loadingState = LoadingState.initial.obs;
  bool hasTopRated = false;
  bool hasRecommended = false;
  late TopRatedResponse topRatedResponse;
  late List<Movie> movies = [];
  late List<Movie> recommended = [];

  @override
  Future<void> onInit() async {
    getTopRated();
    getRecommended();

    super.onInit();
  }

// ignore: slash_for_doc_comments
/**
* @sumary: Consulta las peliculas mejor calificadas
*/
  Future<void> getTopRated() async {
    try {
      loadingState(LoadingState.loading);
      var result = await apiRepositoryInterface.getTopRated();
      if (result.success == false) {
        loadingState(LoadingState.initial);
        return;
      }
      var str = json.encode(result.data);
      final topRatedResponse = topRatedResponseFromJson(str);
      movies = topRatedResponse.results;
      hasTopRated = movies.isNotEmpty;
      update(['updateMovies']);
      loadingState(LoadingState.initial);
    } catch (e) {
      // ignore: avoid_print
      print(e);
      loadingState(LoadingState.initial);
    }
  }

// ignore: slash_for_doc_comments
/**
* @sumary: Consulta las peliculas recomendadas
*/
  Future<void> getRecommended() async {
    try {
      loadingState(LoadingState.loading);
      var result = await apiRepositoryInterface.getRecommended();
      if (result.success == false) {
        loadingState(LoadingState.initial);
        return;
      }
      var str = json.encode(result.data);
      final recommendedResponse = topRatedResponseFromJson(str);
      recommended = recommendedResponse.results;
      hasRecommended = recommended.isNotEmpty;
      update(['updateRecommended']);
      loadingState(LoadingState.initial);
    } catch (e) {
      // ignore: avoid_print
      print(e);
      loadingState(LoadingState.initial);
    }
  }
}

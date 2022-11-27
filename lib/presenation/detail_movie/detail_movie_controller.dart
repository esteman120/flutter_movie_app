import 'package:get/get.dart';
import 'package:movie_app/domain/repository/api_repository_interface.dart';
import 'package:movie_app/domain/response/movie_detail.dart';
import 'package:movie_app/domain/utils/state_loading.dart';
import 'package:movie_app/presenation/routes/app_navigation.dart';

// ignore: slash_for_doc_comments
/**
* Controlador de la vista de detalle de pelicula, recibe un parametro con el id de la pelicula 
  y hace la consulta del detalle de la pelicula
* @author: EB
* @version: v1.0.0  
* @created: 27/11/2022
* @update: 
*/
class DetailMovieController extends GetxController {
  final ApiRepositoryInterface apiRepositoryInterface;

  DetailMovieController(this.apiRepositoryInterface);

  var loadingState = LoadingState.initial.obs;
  String idMovie = "";
  late MovieDetailResponse movie;
  bool hasInfoMovie = false;
  String studio = "";
  String genre = "";
  String release = "";

  @override
  void onInit() {
    idMovie = Get.arguments['idMovie'].toString();
    getMovie();
    super.onInit();
  }

// ignore: slash_for_doc_comments
/**
* @sumary: hace el llamado al api para obtener el detalle de la pelicula 
*/
  Future<void> getMovie() async {
    try {
      hasInfoMovie = false;
      loadingState(LoadingState.loading);
      var result = await apiRepositoryInterface.getMovie(idMovie);
      if (result.success == false) {
        loadingState(LoadingState.initial);
        return;
      }
      movie = MovieDetailResponse.fromJson(result.data);
      hasInfoMovie = true;
      studio = movie.productionCompanies.map((e) => e.name).join(', ');
      genre = movie.genres.map((e) => e.name).join(', ');
      release = movie.releaseDate.year.toString();
      update(['updateMovie']);
      loadingState(LoadingState.initial);
    } catch (e) {
      loadingState(LoadingState.initial);
      // ignore: avoid_print
      print(e);
    }
  }

// ignore: slash_for_doc_comments
/**
* @sumary: hace el volver a la pantalla del dashboard
*/
  goToBack() {
    Get.offAndToNamed(Routes.dashboard);
  }
}

import 'package:get/get.dart';
import 'package:movie_app/presenation/detail_movie/detail_movie_controller.dart';

class DetailMovieBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => DetailMovieController(Get.find()),
    );
  }
}

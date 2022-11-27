import 'package:get/get.dart';
import 'package:movie_app/data/datasource/api_repository_impl.dart';
import 'package:movie_app/domain/repository/api_repository_interface.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApiRepositoryInterface>(() => ApiRepositoryImpl());
  }
}

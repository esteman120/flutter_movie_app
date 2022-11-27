import 'package:get/get.dart';
import 'package:movie_app/presenation/dashboard/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => DashboardController(Get.find()),
    );
  }
}

import 'package:get/get.dart';
import 'package:movie_app/presenation/detail_movie/detail_movie_binding.dart';
import 'package:movie_app/presenation/detail_movie/detail_movie_page.dart';
import 'package:movie_app/presenation/main_binding.dart';
import 'package:movie_app/presenation/dashboard/dashboard_binding.dart';
import 'package:movie_app/presenation/dashboard/dashboard_page.dart';

class Routes {
  static const String dashboard = '/dashboard';
  static const String detailMovie = '/detailMovie';
}

class NavigationPage {
  static final pages = [
    GetPage(
        name: Routes.dashboard,
        page: () => DashboardPage(),
        bindings: [MainBinding(), DashboardBinding()]),
    GetPage(
        name: Routes.detailMovie,
        page: () => DetailMoviePage(),
        bindings: [MainBinding(), DetailMovieBinding()]),
  ];
}

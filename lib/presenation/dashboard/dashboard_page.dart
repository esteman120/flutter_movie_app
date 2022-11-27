import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/domain/utils/responsive.dart';
import 'package:movie_app/domain/utils/state_loading.dart';
import 'package:movie_app/presenation/dashboard/dashboard_controller.dart';
import 'package:movie_app/presenation/routes/app_navigation.dart';
import 'package:movie_app/presenation/theme.dart';
import 'package:movie_app/presenation/widgets/box_movie_widget.dart';
import 'package:movie_app/presenation/widgets/loading_widget.dart';

// ignore: slash_for_doc_comments
/**
* Esta pantalla hace la carga inicial del app y muestra las peliculas sugeridas y el top rated
* @author: EB
* @version: v1.0.0  
* @created: 27/11/2022
* @update: 
*/
class DashboardPage extends GetWidget<DashboardController> {
  DashboardPage({Key? key}) : super(key: key);
  late Responsive responsive;
  @override
  Widget build(BuildContext context) {
    responsive = Responsive.of(context);
    return WillPopScope(
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              Container(
                width: responsive.width,
                color: Theme.of(Get.context!).colorScheme.colorSecondary,
                child: Column(
                  children: [
                    Expanded(
                      child: whatDoYouWantPanel(),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        decoration: BoxDecoration(
                          color:
                              Theme.of(Get.context!).colorScheme.colorPrimary,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                        ),
                        child: Column(
                          children: [
                            Container(
                              child: recommendedForYou(),
                            ),
                            Container(
                              child: topRated(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Obx(() {
                if (controller.loadingState.value == LoadingState.loading) {
                  return const LoadingWidget();
                } else {
                  return const SizedBox.shrink();
                }
              }),
            ],
          ),
        ),
      ),
      onWillPop: _onWillPop,
    );
  }

// ignore: slash_for_doc_comments
/**
* @return: Retorna widget con una columna que contiene el titulo de la seccion 
y la lista de las peliculas recomendadas
*/
  Widget recommendedForYou() {
    return Column(
      children: [
        titleSectionMethod('RECOMMENDED FOR YOU'),
        GetBuilder<DashboardController>(
          id: 'updateRecommended',
          builder: (_) {
            return controller.hasRecommended == true
                ? BoxMovieWidget(
                    movies: controller.recommended,
                    selectMovie: (element) {
                      Get.toNamed(Routes.detailMovie,
                          arguments: {'idMovie': element});
                    },
                  )
                : const SizedBox.shrink();
          },
        ),
      ],
    );
  }

// ignore: slash_for_doc_comments
/**
* @return: Retorna widget con una columna que contiene el titulo de la seccion 
y la lista de las peliculas recomendadas
*/
  Widget topRated() {
    return Column(
      children: [
        titleSectionMethod('TOP RATED'),
        GetBuilder<DashboardController>(
          id: 'updateMovies',
          builder: (_) {
            return controller.hasTopRated == true
                ? BoxMovieWidget(
                    movies: controller.movies,
                    selectMovie: (element) {
                      Get.toNamed(Routes.detailMovie,
                          arguments: {'idMovie': element});
                    },
                  )
                : const SizedBox.shrink();
          },
        ),
      ],
    );
  }

// ignore: slash_for_doc_comments
/**
  * @param: nameSection String, nombre de la seccion 
  * @return: Este metodo devuelve los titulos de recomendados y ver todos, Top Rated y see all
*/
  Padding titleSectionMethod(String nameSection) {
    return Padding(
      // padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            nameSection,
            style: TextStyle(
              color: Theme.of(Get.context!).colorScheme.colorTitles,
            ),
          ),
          Text(
            'See all',
            style: TextStyle(
              color: Theme.of(Get.context!).colorScheme.colorSubTitles,
            ),
          ),
        ],
      ),
    );
  }

// ignore: slash_for_doc_comments
/**
* @return: Retorna widget que contiene el titulo de seccion y el input search
*/
  Widget whatDoYouWantPanel() {
    return Container(
      color: Theme.of(Get.context!).colorScheme.colorSecondary,
      width: responsive.wp(80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: responsive.hp(5),
          ),
          Container(
            child: Text(
              'Hello, what do you want to watch ?',
              style: TextStyle(
                color: Theme.of(Get.context!).colorScheme.colorTitles,
                fontSize: responsive.wp(8),
              ),
            ),
          ),
          SizedBox(
            height: responsive.hp(4),
          ),
          inputSearch(),
        ],
      ),
    );
  }

// ignore: slash_for_doc_comments
/**
* @return: Retorna el input del buscador
*/
  Widget inputSearch() {
    return TextFormField(
      decoration: InputDecoration(
        border: InputBorder.none,
        filled: true,
        fillColor: Colors.white.withOpacity(0.2),
        hintText: 'Search',
        hintStyle: const TextStyle(color: Colors.white),
        contentPadding:
            const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(25.7),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(25.7),
        ),
        prefixIcon: const Icon(Icons.search, color: Colors.white, size: 16.0),
      ),
    );
  }

// ignore: slash_for_doc_comments
/**
* @return: Retorna false y evita salir de la aplicacion si hace hacia atras
*/
  Future<bool> _onWillPop() async {
    return false;
  }
}

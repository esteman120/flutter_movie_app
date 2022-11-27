import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/domain/config/app_configuration.dart';
import 'package:movie_app/domain/utils/responsive.dart';
import 'package:movie_app/domain/utils/state_loading.dart';
import 'package:movie_app/presenation/detail_movie/detail_movie_controller.dart';
import 'package:movie_app/presenation/theme.dart';
import 'package:movie_app/presenation/widgets/loading_widget.dart';
import 'package:movie_app/presenation/widgets/rate_star_widget.dart';

// ignore: slash_for_doc_comments
/**
* Esta pantalla se puede ver el detalle de una pelicula
* @author: EB
* @version: v1.0.0  
* @created: 27/11/2022
* @update: 
*/
class DetailMoviePage extends GetWidget<DetailMovieController> {
  DetailMoviePage({Key? key}) : super(key: key);
  late Responsive responsive;
  final urlImage = AppConfiguration.urlImage.toString();
  @override
  Widget build(BuildContext context) {
    responsive = Responsive.of(context);
    return WillPopScope(
      onWillPop: _onWillPop,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              Container(
                width: responsive.width,
                color: Theme.of(Get.context!).colorScheme.colorPrimary,
                child: GetBuilder<DetailMovieController>(
                    id: 'updateMovie',
                    builder: (_) {
                      return Column(
                        children: [
                          Expanded(
                            flex: 1,
                            child: imagePanel(),
                          ),
                          Expanded(
                            flex: 2,
                            child: informationPanel(),
                          ),
                        ],
                      );
                      // return controller.hasInfoMovie == true
                      //     ? Column(
                      //         children: [
                      //           Expanded(
                      //             flex: 1,
                      //             child: imagePanel(),
                      //           ),
                      //           Expanded(
                      //             flex: 2,
                      //             child: informationPanel(),
                      //           ),
                      //         ],
                      //       )
                      //     : const SizedBox.shrink();
                    }),
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
    );
  }

// ignore: slash_for_doc_comments
/**
* @return: Retorna widget con la informacion de la pelicula, nombre, calificacion, descripcion, 
  actores, produccion y año de creacion
*/
  Widget informationPanel() {
    return Padding(
      padding: EdgeInsets.only(
        top: responsive.hp(5),
        left: responsive.wp(8),
        right: responsive.wp(8),
      ),
      child: controller.hasInfoMovie == true
          ? Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: responsive.wp(70),
                      child: Text(controller.movie.title,
                          style: TextStyle(
                            color:
                                Theme.of(Get.context!).colorScheme.colorTitles,
                            fontSize: responsive.wp(6),
                            fontWeight: FontWeight.w500,
                          )),
                    ),
                    Icon(
                      Icons.live_tv,
                      color: Theme.of(Get.context!).colorScheme.colorSubTitles,
                    ),
                  ],
                ),
                SizedBox(
                  height: responsive.hp(2),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: responsive.wp(40),
                      height: responsive.hp(5),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Theme.of(Get.context!).colorScheme.colorWatchNow,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        'WATCH NOW',
                        style: TextStyle(
                            color:
                                Theme.of(Get.context!).colorScheme.colorTitles,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    IconTheme(
                      data: const IconThemeData(
                        color: Colors.amber,
                      ),
                      child: StarDisplay(
                          value: controller.movie.voteAverage.ceil()),
                    ),
                  ],
                ),
                SizedBox(
                  height: responsive.hp(3),
                ),
                SizedBox(
                  height: responsive.hp(15),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Text(
                      controller.movie.overview,
                      style: TextStyle(
                        color:
                            Theme.of(Get.context!).colorScheme.colorSubTitles,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: responsive.hp(2),
                ),
                actorsWidget(),
                SizedBox(
                  height: responsive.hp(2),
                ),
                SizedBox(
                  height: responsive.hp(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Studio',
                            style: TextStyle(
                              color: Theme.of(Get.context!)
                                  .colorScheme
                                  .colorTitles,
                            ),
                          ),
                          SizedBox(
                            width: responsive.wp(5),
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Text(
                                controller.studio,
                                style: TextStyle(
                                    color: Theme.of(Get.context!)
                                        .colorScheme
                                        .colorSubTitles),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Genre',
                            style: TextStyle(
                              color: Theme.of(Get.context!)
                                  .colorScheme
                                  .colorTitles,
                            ),
                          ),
                          SizedBox(
                            width: responsive.wp(5),
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Text(
                                controller.genre,
                                style: TextStyle(
                                    color: Theme.of(Get.context!)
                                        .colorScheme
                                        .colorSubTitles),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Release',
                            style: TextStyle(
                              color: Theme.of(Get.context!)
                                  .colorScheme
                                  .colorTitles,
                            ),
                          ),
                          SizedBox(
                            width: responsive.wp(5),
                          ),
                          Text(
                            controller.release,
                            style: TextStyle(
                                color: Theme.of(Get.context!)
                                    .colorScheme
                                    .colorSubTitles),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )
          : const SizedBox.shrink(),
    );
  }

// ignore: slash_for_doc_comments
/**
* @return: Retorna widget con la lista de actores principales de la pelicula
*/
  Widget actorsWidget() {
    return SizedBox(
      height: responsive.hp(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          actorWidget(),
          actorWidget(),
          actorWidget(),
          actorWidget(),
        ],
      ),
    );
  }

// ignore: slash_for_doc_comments
/**
* @return: Retorna widget con el nombre y la foto del actor
*/
  Widget actorWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: responsive.dp(6),
          height: responsive.dp(6),
          decoration: const BoxDecoration(
            color: Colors.orange,
            shape: BoxShape.circle,
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: responsive.wp(20),
          child: Text(
            'Nombre Actor',
            textAlign: TextAlign.justify,
            style: TextStyle(
              color: Theme.of(Get.context!).colorScheme.colorSubTitles,
            ),
          ),
        ),
      ],
    );
  }

// ignore: slash_for_doc_comments
/**
* @return: Retorna widget con la imagen principal de la pelicula
*/
  Widget imagePanel() {
    return controller.hasInfoMovie == true
        ? Container(
            decoration: BoxDecoration(
              color: Theme.of(Get.context!).colorScheme.colorPrimary,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              image: DecorationImage(
                image: NetworkImage(urlImage + controller.movie.posterPath),
                fit: BoxFit.fill,
              ),
            ),
            child: Container(
              alignment: Alignment.topCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      controller.goToBack();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Theme.of(Get.context!).colorScheme.colorTitles,
                      size: responsive.wp(10),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite_border,
                      color: Theme.of(Get.context!).colorScheme.colorTitles,
                      size: responsive.wp(10),
                    ),
                  ),
                ],
              ),
            ),
          )
        : const SizedBox.shrink();
  }

  Future<bool> _onWillPop() async {
    controller.goToBack();
    return false;
  }
}

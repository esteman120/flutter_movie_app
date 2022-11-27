import 'package:flutter/material.dart';
import 'package:movie_app/domain/config/app_configuration.dart';
import 'package:movie_app/domain/response/movie.dart';
import 'package:movie_app/domain/utils/responsive.dart';
import 'package:movie_app/presenation/theme.dart';
import 'package:movie_app/presenation/widgets/rate_star_widget.dart';

// ignore: slash_for_doc_comments
/**
* Este widget crea el list view de las peliculas
* @author: EB
* @version: 27/11/2022
*/
class BoxMovieWidget extends StatelessWidget {
  BoxMovieWidget({
    Key? key,
    required this.movies,
    required this.selectMovie,
  }) : super(key: key);

  Function selectMovie;
  final List<Movie> movies;
  final urlImage = AppConfiguration.urlImage.toString();

  @override
  Widget build(BuildContext context) {
    var responsive = Responsive.of(context);
    return Container(
      // margin: EdgeInsets.symmetric(vertical: 20.0),
      height: responsive.hp(23),
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 30),
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return Padding(
            padding: const EdgeInsets.only(right: 17),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  child: Container(
                    width: responsive.wp(30),
                    height: responsive.hp(16),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(urlImage + movie.posterPath),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  onTap: () {
                    selectMovie(movie.id);
                  },
                ),
                Container(
                  width: responsive.wp(30),
                  child: Text(
                    movie.title,
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Theme.of(context).colorScheme.colorTitles,
                    ),
                  ),
                ),
                Container(
                  child: IconTheme(
                    data: const IconThemeData(
                      color: Colors.amber,
                    ),
                    child: StarDisplay(value: movie.voteAverage.ceil()),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

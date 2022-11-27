// ignore: file_names
// To parse this JSON data, do
//
//     final topRatedResponse = topRatedResponseFromJson(jsonString);

import 'dart:convert';

import 'package:movie_app/domain/response/movie.dart';

TopRatedResponse topRatedResponseFromJson(String str) =>
    TopRatedResponse.fromJson(json.decode(str));

String topRatedResponseToJson(TopRatedResponse data) =>
    json.encode(data.toJson());

class TopRatedResponse {
  TopRatedResponse({
    required this.page,
    required this.results,
    required this.totalResults,
    required this.totalPages,
  });

  int page;
  List<Movie> results;
  int totalResults;
  int totalPages;

  factory TopRatedResponse.fromJson(Map<String, dynamic> json) =>
      TopRatedResponse(
        page: json["page"],
        results:
            List<Movie>.from(json["results"].map((x) => Movie.fromJson(x))),
        totalResults: json["total_results"],
        totalPages: json["total_pages"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "total_results": totalResults,
        "total_pages": totalPages,
      };
}

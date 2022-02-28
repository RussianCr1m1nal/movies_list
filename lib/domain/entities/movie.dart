
import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable()
class Movie {
  final String title;
  final String overview;
  final DateTime? releaseDate;
  final List<String> genres;
  final String posterPath;
  final double voteAverage;
  final int runtime;

  Movie(
      {required this.title,
      required this.overview,
      required this.releaseDate,
      required this.genres,
      required this.posterPath,
      required this.voteAverage,
      required this.runtime});

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
}

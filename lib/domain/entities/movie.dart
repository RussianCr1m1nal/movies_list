import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable()
class Movie {
  @JsonKey(name: 'original_title')
  final String title;

  @JsonKey(name: 'overview')
  final String overview;

  @JsonKey(name: 'release_date')
  final DateTime? releaseDate;

  @JsonKey(name: 'genres')
  final List<String> genres;

  @JsonKey(name: 'poster_path')
  final String posterPath;

  @JsonKey(name: 'vote_average')
  final double voteAverage;

  @JsonKey(name: 'runtime')
  final int runtime;

  @JsonKey(name: 'id')
  final int id;

  Movie(
      {required this.title,
      required this.overview,
      required this.releaseDate,
      required this.genres,
      required this.posterPath,
      required this.voteAverage,
      required this.runtime,
      required this.id});

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
}

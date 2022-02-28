
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

  // Movie.fromJson(Map<String, dynamic> movieData)
  //     : title = movieData['original_title'] ?? '',
  //       overview = movieData['overview'] ?? '',
  //       genres = movieData['genres'] ?? [],
  //       releaseDate = movieData['release_date'],
  //       posterPath = movieData['poster_path'] ?? '',
  //       voteAverage = double.tryParse(movieData['vote_average'].toString()) ?? 0.0,
  //       runtime = movieData['runtime'] ?? 0;
}

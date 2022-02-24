class Movie {
  final String title;
  final String overview;
  final String releaseDate;
  final List<dynamic> genres;
  final String posterPath;
  final double voteAverage;

  Movie(
      {required this.title,
      required this.overview,
      required this.releaseDate,
      required this.genres,
      required this.posterPath,
      required this.voteAverage});

  Movie.fromJson(Map<String, dynamic> movieData)
      : title = movieData['original_title'] ?? '',
        overview = movieData['overview'] ?? '',
        genres = movieData['genre_ids'] ?? [],
        releaseDate = movieData['release_date'] ?? '',
        posterPath = movieData['poster_path'] ?? '',
        voteAverage = double.tryParse(movieData['vote_average'].toString()) ?? 0.0;
}

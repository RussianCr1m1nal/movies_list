
class Movie {
  late final String _title;
  late final String _overview;
  late final String _releaseDate;
  late final List<dynamic> _genres;
  late final String _posterPath;
  late final double _voteAverage;

  Movie(this._title, this._overview, this._releaseDate, this._genres, this._posterPath, this._voteAverage);

  Movie.fromJson(Map<String, dynamic> movieData) {
    
    _title = movieData['original_title'] ?? '';
    _overview = movieData['overview'] ?? '';
    _genres = movieData['genre_ids'] ?? [];
    _releaseDate = movieData['release_date'] ?? '';
    _posterPath = movieData['poster_path'] ?? '';
    _voteAverage = double.tryParse(['vote_average'].toString()) ?? 0.0;
  }

  String get title => _title;
  String get overview => _overview;
  String get releaseDate => _releaseDate;
  List<dynamic> get genres => _genres;
  String get posterPath => _posterPath;
  double get voteAverage => _voteAverage;
}

import 'dart:convert';

class Movie {
  late final String _title;
  late final String _overview;
  late final DateTime _releaseDate;
  late final List<int> _genres;
  late final String _posterPath;
  late final double _voteAverage;

  Movie(this._title, this._overview, this._releaseDate, this._genres, this._posterPath, this._voteAverage);

  Movie.fromJson(String json) {
    final movieData = jsonDecode(json);
    
    _title = movieData['original_title'];
    _overview = movieData['overview'];
    _genres = movieData['genre_ids'];
    _releaseDate = movieData['release_date'];
    _posterPath = movieData['poster_path'];
    _voteAverage = movieData['vote_average'];
  }

  String get title => _title;
  String get overview => _overview;
  DateTime get releaseDate => _releaseDate;
  List<int> get genres => _genres;
  String get posterPath => _posterPath;
  double get voteAverage => _voteAverage;
}
import 'dart:async';

abstract class MoviesDataSource {
  Future<List<Map<String, dynamic>>> getMoviesFromPage(int page);
}


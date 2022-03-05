import 'package:movies_list/domain/entities/movie.dart';

abstract class MoviesRepository {
  Future<List<Movie>> getMoviesFromPage(int page);
  Stream<List<Movie>> watchMovies(int page);
  Future<void> updateMoviesOnPage(int page);
}

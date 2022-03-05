import 'package:movies_list/data/database/movies_database.dart';
import 'package:movies_list/data/movies_data_source.dart';

abstract class MoviesLocalDataSource extends MoviesDataSource {
  Future<void> updateMoviesOnPage(int page, List<Map<String, dynamic>> movies);
  Stream<List<MovieExpand>> watchMovies();
}

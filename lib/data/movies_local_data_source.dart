import 'package:movies_list/data/movies_data_source.dart';

abstract class MoviesLocalDataSource extends MoviesDataSource {
  Future<void> updateMoviesOnPage(int page, List<Map<String, dynamic>> movies);
}

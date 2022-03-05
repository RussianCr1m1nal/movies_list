import 'package:movies_list/data/database/movies_database.dart';
import 'package:movies_list/data/movies_local_data_source.dart';

class MoviesDataSourceDB extends MoviesLocalDataSource {
  final MoviesDataBase dataBase;

  MoviesDataSourceDB({required this.dataBase});

  @override
  Future<List<Map<String, dynamic>>> getMoviesFromPage(int page) async {
    return (await dataBase.moviesDao.getMoviesFromPageWithGenres(page)).map((movieExpand) {
      Map<String, dynamic> movieMap = movieExpand.movie.toJson();
      movieMap.putIfAbsent(
          'genres', () => movieExpand.genres == null ? [] : movieExpand.genres!.map((genre) => genre.name).toList());
      return movieMap;
    }).toList();
  }

  @override
  Future<void> updateMoviesOnPage(int page, List<Map<String, dynamic>> movies) async {
    await dataBase.moviesDao.updateMoviesOnPage(page, movies);
  }

  @override
  Stream<List<MovieExpand>> watchMovies(int page) {
    return dataBase.moviesDao.watchMovies(page);
  }
}

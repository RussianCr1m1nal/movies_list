import 'package:movies_list/data/database/movies_database.dart';
import 'package:movies_list/data/movies_local_data_source.dart';

class MoviesDataSourceDB extends MoviesLocalDataSource {
  final MoviesDataBase dataBase;

  MoviesDataSourceDB({required this.dataBase});

  @override
  Future<List<Map<String, dynamic>>> getMoviesFromPage(int page) async {
    List<Movie> movies = await dataBase.getMoviesFromPage(page);

    List<Map<String, dynamic>> moviesList = [];

    for (Movie movie in movies) {
      Map<String, dynamic> movieMap = movie.toJson();
      List<String> genres = await dataBase.getMoviesGenres(movie);
      movieMap.putIfAbsent('genres', () => genres);
      moviesList.add(movieMap);
    }

    return moviesList;
  }

  @override
  Future<void> updateMoviesOnPage(int page, List<Map<String, dynamic>> movies) async {
    await dataBase.updateMoviesOnPage(page, movies);
  }
}

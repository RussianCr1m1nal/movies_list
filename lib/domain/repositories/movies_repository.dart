import 'package:movies_list/data/movies_datasource.dart';
import 'package:movies_list/domain/entities/movie.dart';

abstract class MoviesRepository {
  Future<List<Movie>> getMoviesFromPage(int page);
}

class MoviesRepositoryTMDB extends MoviesRepository {
  final MoviesDataSource moviesService;

  MoviesRepositoryTMDB({required this.moviesService});

  @override
  Future<List<Movie>> getMoviesFromPage(int page) async {
    List<Map<String, dynamic>> moviesData = await moviesService.getMoviesFromPage(page);

    return moviesData.map((elemet) => Movie.fromJson(elemet)).toList();
  }
}

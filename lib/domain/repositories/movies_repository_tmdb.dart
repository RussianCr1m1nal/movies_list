import 'package:movies_list/data/movies_data_source.dart';
import 'package:movies_list/domain/entities/movie.dart';
import 'package:movies_list/domain/repositories/movies_repository.dart';

class MoviesRepositoryTMDB extends MoviesRepository {
  final MoviesDataSource dataSource;

  MoviesRepositoryTMDB({required this.dataSource});

  @override
  Future<List<Movie>> getMoviesFromPage(int page) async {
    List<Map<String, dynamic>> moviesData = await dataSource.getMoviesFromPage(page);

    return moviesData.map((elemet) => Movie.fromJson(elemet)).toList();
  }

  @override
  Stream<List<Movie>> watchMovies(int page) {   
    throw UnimplementedError();
  }

  @override
  Future<void> updateMoviesOnPage(int page) {    
    throw UnimplementedError();
  }
}

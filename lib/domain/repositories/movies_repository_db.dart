import 'package:movies_list/data/movies_local_data_source.dart';
import 'package:movies_list/data/movies_remote_data_source.dart';
import 'package:movies_list/domain/entities/movie.dart';
import 'package:movies_list/domain/repositories/movies_repository.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class MoviesRepositoryDB extends MoviesRepository {
  final MoviesLocalDataSource localDataSource;
  final MoviesRemoteDataSource remoteDataSource;

  MoviesRepositoryDB({required this.localDataSource, required this.remoteDataSource});

  @override
  Future<List<Movie>> getMoviesFromPage(int page) async {
    bool internetConnection = await InternetConnectionChecker().hasConnection;

    if (internetConnection) {
      await _updateFromRemote(page);
    }

    return (await localDataSource.getMoviesFromPage(page)).map((element) => Movie.fromJson(element)).toList();
  }

  Future<void> _updateFromRemote(int page) async {
    List<Map<String, dynamic>> moviesList = await remoteDataSource.getMoviesFromPage(page);
    await localDataSource.updateMoviesOnPage(page, moviesList);
  }
}

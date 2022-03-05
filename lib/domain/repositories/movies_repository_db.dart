import 'dart:async';

import 'package:movies_list/data/movies_local_data_source.dart';
import 'package:movies_list/data/movies_remote_data_source.dart';
import 'package:movies_list/domain/entities/movie.dart';
import 'package:movies_list/domain/repositories/movies_repository.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:rxdart/rxdart.dart';

class MoviesRepositoryDB extends MoviesRepository {
  final MoviesLocalDataSource localDataSource;
  final MoviesRemoteDataSource remoteDataSource;

  final BehaviorSubject<List<Movie>> _moviesStream = BehaviorSubject<List<Movie>>.seeded([]);
  late StreamSubscription moviesSubscription;

  MoviesRepositoryDB({required this.localDataSource, required this.remoteDataSource}) {
    _watchMovies();
  }

  @override
  Future<List<Movie>> getMoviesFromPage(int page) async {
    bool internetConnection = await InternetConnectionChecker().hasConnection;

    if (internetConnection) {
      await _updateFromRemote(page);
    }

    return (await localDataSource.getMoviesFromPage(page)).map((element) => Movie.fromJson(element)).toList();
  }

  @override
  Future<void> updateMoviesOnPage(int page) async {
    InternetConnectionChecker().hasConnection.then((hasConnection) {
      if (hasConnection) {
        _updateFromRemote(page);
      }
    });
  }

  @override
  Stream<List<Movie>> watchMovies() {
    return _moviesStream.stream;
  }

  Future<void> _updateFromRemote(int page) async {
    List<Map<String, dynamic>> moviesList = await remoteDataSource.getMoviesFromPage(page);
    await localDataSource.updateMoviesOnPage(page, moviesList);
  }

  void _watchMovies() {
    // moviesSubscription.cancel();
    moviesSubscription = localDataSource
        .watchMovies()
        .map((movies) => movies.map((expand) {
              return Movie(
                  title: expand.movie.title,
                  overview: expand.movie.overview,
                  releaseDate: expand.movie.releaseDate,
                  genres: expand.genres == null ? [] : expand.genres!.map((genre) => genre.name).toList(),
                  posterPath: expand.movie.posterPath,
                  voteAverage: expand.movie.voteAverage,
                  runtime: expand.movie.runtime,
                  id: expand.movie.id,
                  page: expand.movie.page);
            }).toList())
        .listen((moviesList) {
      _moviesStream.add(moviesList);
    });
  }

  void dispose() {
    moviesSubscription.cancel();
    _moviesStream.close();
  }
}

import 'package:dartz/dartz.dart';
import 'package:movies_list/core/failure.dart';
import 'package:movies_list/domain/entities/movie.dart';
import 'package:movies_list/domain/repositories/movies_repository.dart';

class WatchMoviesUseCase {
  final MoviesRepository repository;

  WatchMoviesUseCase({required this.repository});

  Future<Either<Failure, Stream<List<Movie>>>> call() async {
    try {
      return Right(repository.watchMovies());
    } catch (exception) {
      return Left(Failure(message: exception.toString()));
    }
  }
}

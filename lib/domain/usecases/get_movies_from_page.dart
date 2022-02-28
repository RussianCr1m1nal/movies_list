import 'package:dartz/dartz.dart';
import 'package:movies_list/core/failure.dart';
import 'package:movies_list/domain/entities/movie.dart';
import 'package:movies_list/domain/repositories/movies_repository.dart';

class GetMoviesFromPageUseCase {
  final MoviesRepository repository;

  GetMoviesFromPageUseCase({required this.repository});
  
  Future<Either<Failure, List<Movie>>> call(int page) async {
    try {
      return Right(await repository.getMoviesFromPage(page));
    } catch(exception) {
      return Left(Failure(message: exception.toString()));
    }
  }
}
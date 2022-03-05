
import 'package:dartz/dartz.dart';
import 'package:movies_list/core/failure.dart';
import 'package:movies_list/domain/repositories/movies_repository.dart';

class UpdateMoviesOnPageUseCase {
  final MoviesRepository repository;

  UpdateMoviesOnPageUseCase({required this.repository});
  
  Future<Either<Failure, void>> call(int page) async {
    try {
      return Right(repository.updateMoviesOnPage(page));
    } catch(exception) {
      return Left(Failure(message: exception.toString()));
    }
  }
}

import 'package:movies_list/data/repositories/movies_repository.dart';
import 'package:movies_list/domain/movie.dart';

class GetMoviesFromPageUseCase {
  final MoviesRepository repository;

  GetMoviesFromPageUseCase({required this.repository});

  Future<List<Movie>> call(int page) async {
    return await repository.getMoviesFromPage(page);
  }
}
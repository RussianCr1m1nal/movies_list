import 'package:movies_list/domain/movie.dart';
import 'package:movies_list/domain/repositories/movies_repository.dart';

class GetMoviesFromPageUseCase {
  final MoviesRepository repository;

  GetMoviesFromPageUseCase({required this.repository});

  Future<List<Movie>> call(int page) async {
    try {
      return await repository.getMoviesFromPage(page);
    } catch(exception) {
      return [];
    }
  }
}

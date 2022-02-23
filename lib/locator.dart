
import 'package:get_it/get_it.dart';
import 'package:movies_list/data/movies_service.dart';
import 'package:movies_list/data/repositories/movies_repository.dart';
import 'package:movies_list/domain/usecases/get_movies_from_page.dart';

final getIt = GetIt.instance; 

void setup() {
  getIt.registerSingleton<MoviesServiceAPI>(MoviesServiceAPI('f0529e69ce7a4601dc3e1c36ed7d9ef3'));
  getIt.registerSingleton<MoviesRepository>(MoviesRepository(moviesService: GetIt.I<MoviesServiceAPI>()));
  getIt.registerSingleton<GetMoviesFromPageUseCase>(GetMoviesFromPageUseCase(repository: GetIt.I<MoviesRepository>()));
}
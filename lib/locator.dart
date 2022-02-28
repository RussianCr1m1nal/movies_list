import 'package:get_it/get_it.dart';
import 'package:movies_list/data/movies_data_source.dart';
import 'package:movies_list/data/movies_data_source_tmdb.dart';
import 'package:movies_list/domain/repositories/movies_repository.dart';
import 'package:movies_list/domain/repositories/movies_repository_tmdb.dart';
import 'package:movies_list/domain/usecases/get_movies_from_page.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<MoviesDataSource>(MoviesDataSourceTMDB('f0529e69ce7a4601dc3e1c36ed7d9ef3'));
  getIt.registerSingleton<MoviesRepository>(MoviesRepositoryTMDB(moviesService: GetIt.I<MoviesDataSource>()));
  getIt.registerSingleton<GetMoviesFromPageUseCase>(GetMoviesFromPageUseCase(repository: GetIt.I<MoviesRepository>()));
}

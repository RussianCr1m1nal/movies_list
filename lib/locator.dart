import 'package:get_it/get_it.dart';
import 'package:movies_list/data/database/movies_database.dart';
import 'package:movies_list/data/movies_data_source_db.dart';
import 'package:movies_list/data/movies_data_source_tmdb.dart';
import 'package:movies_list/data/movies_local_data_source.dart';
import 'package:movies_list/data/movies_remote_data_source.dart';
import 'package:movies_list/domain/repositories/movies_repository.dart';
import 'package:movies_list/domain/repositories/movies_repository_db.dart';
import 'package:movies_list/domain/usecases/get_movies_from_page.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<MoviesDataBase>(MoviesDataBase());

  getIt.registerSingleton<MoviesLocalDataSource>(MoviesDataSourceDB(dataBase: GetIt.I<MoviesDataBase>()));
  getIt.registerSingleton<MoviesRemoteDataSource>(MoviesDataSourceTMDB('f0529e69ce7a4601dc3e1c36ed7d9ef3'));

  getIt.registerSingleton<MoviesRepository>(MoviesRepositoryDB(
      localDataSource: GetIt.I<MoviesLocalDataSource>(), remoteDataSource: GetIt.I<MoviesRemoteDataSource>()));

  getIt.registerSingleton<GetMoviesFromPageUseCase>(GetMoviesFromPageUseCase(repository: GetIt.I<MoviesRepository>()));
}

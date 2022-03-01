import 'dart:async';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

part 'movies_database.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final folder = await getApplicationDocumentsDirectory();
    final file = File(path.join(folder.path, 'movies_database.sqlite'));
    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [Movies, Genres, MoviesGenres])
class MoviesDataBase extends _$MoviesDataBase {
  MoviesDataBase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<void> updateMoviesOnPage(int page, List<Map<String, dynamic>> movies) async {
    List<Movie> currentMoviesOnPage = await getMoviesFromPage(page);

    if (currentMoviesOnPage.isNotEmpty) {
      await deleteMoviesFromPage(currentMoviesOnPage);
    }

    for (Map<String, dynamic> movieMap in movies) {
      await insertMovieInfo(movieMap, page);
    }
  }

  Future<List<String>> getMoviesGenres(Movie movie) async {
    List<MovieGenre> movieGeners = await (select(moviesGenres)..where((table) => table.id.equals(movie.id))).get();
    return (await (select(genres)..where((table) => table.id.isIn(movieGeners.map((e) => e.id)))).get())
        .map((e) => e.name)
        .toList();
  }

  Future<void> deleteMoviesFromPage(List<Movie> moviesOnPage) async {
    for (Movie movie in moviesOnPage) {
      await deleteMovie(movie.id);
    }
  }

  Future<void> insertMovieInfo(Map<String, dynamic> movieMap, int page) async {
    movieMap.putIfAbsent('page', () => page);

    int id = await insertMovie(Movie.fromJson(movieMap).toCompanion(true));

    if (movieMap['genres'] != null) {
      await updateMovieGenres(id, movieMap['genres']);
    }
  }

  Future<void> updateMovieGenres(int movieId, List<String> genres) async {
    for (String genreName in genres) {
      int genreId = await getGenreByName(genreName);
      await insertMovieGenre(movieId, genreId);
    }
  }

  Future<int> getGenreByName(String genreName) async {
    Genre? genre = await (select(genres)..where((table) => table.name.equals(genreName))).getSingleOrNull();
    return genre == null ? await insertGenre(GenresCompanion(name: Value(genreName))) : genre.id;
  }

  Future<int> deleteMovie(int id) async {
    return (delete(movies)..where((table) => table.id.equals(id))).go();
  }

  Future<List<Movie>> getMoviesFromPage(int page) async {
    return await (select(movies)..where((table) => table.page.equals(page))).get();
  }

  Future<int> insertMovie(MoviesCompanion companion) async {
    return await into(movies).insert(companion);
  }

  Future<int> insertGenre(GenresCompanion companion) async {
    return await into(genres).insert(companion);
  }

  Future<int> insertMovieGenre(movieId, genreId) async {
    return await into(moviesGenres).insert(MoviesGenresCompanion(movie: Value(movieId), genre: Value(genreId)));
  }
}

// Tables

@DataClassName("Movie")
class Movies extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get runtime => integer()();
  IntColumn get page => integer()();
  TextColumn get overview => text()();

  @JsonKey('original_title')
  TextColumn get title => text().named('original_title')();

  @JsonKey('poster_path')
  TextColumn get posterPath => text().named('poster_path')();

  @JsonKey('vote_average')
  RealColumn get voteAverage => real().named('vote_average')();

  @JsonKey('release_date')
  DateTimeColumn get releaseDate => dateTime().named('release_date').nullable()();
}

@DataClassName("Genre")
class Genres extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
}

@DataClassName("MovieGenre")
class MoviesGenres extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get movie => integer().references(Movies, #id)();
  IntColumn get genre => integer().references(Genres, #id)();
}

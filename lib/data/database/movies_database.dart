import 'dart:async';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:movies_list/data/database/table/table.dart';
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

@DriftDatabase(tables: [Movies, Genres, MoviesGenres], daos: [MoviesDao, GenresDao, MoviesGenresDao])
class MoviesDataBase extends _$MoviesDataBase {
  MoviesDataBase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

class MovieExpand {
  final Movie movie;
  final List<Genre>? genres;

  MovieExpand({required this.movie, this.genres});
}

@DriftAccessor(tables: [Movies, Genres, MoviesGenres])
class MoviesDao extends DatabaseAccessor<MoviesDataBase> with _$MoviesDaoMixin {
  final MoviesDataBase dataBase;

  MoviesDao(this.dataBase) : super(dataBase);

  Stream<List<MovieExpand>> watchMovies(int page) {
    final rows = (select(movies).join([
      leftOuterJoin(moviesGenres, moviesGenres.movie.equalsExp(movies.id)),
      leftOuterJoin(genres, genres.id.equalsExp(moviesGenres.genre)),
    ])
          ..where(movies.page.equals(page)))
        .watch();

    return rows.map((element) {
      return element
          .fold(<int, MovieExpand>{}, (Map<int, MovieExpand> previousValue, resultRow) {
            final movie = resultRow.readTableOrNull(movies);
            final genre = resultRow.readTableOrNull(genres);

            previousValue.update(movie!.id, (value) {
              return MovieExpand(movie: movie, genres: genre == null ? value.genres : [...?value.genres, genre]);
            }, ifAbsent: () {
              return MovieExpand(movie: movie, genres: genre == null ? [] : [genre]);
            });

            return previousValue;
          })
          .values
          .toList();
    });
  }

  Future<List<MovieExpand>> getMoviesFromPageWithGenres(int page) async {
    final rows = await (select(movies).join([
      leftOuterJoin(moviesGenres, moviesGenres.movie.equalsExp(movies.id)),
      leftOuterJoin(genres, genres.id.equalsExp(moviesGenres.genre)),
    ])
          ..where(movies.page.equals(page)))
        .get();

    return rows
        .fold(<int, MovieExpand>{}, (Map<int, MovieExpand> previousValue, resultRow) {
          final movie = resultRow.readTableOrNull(movies);
          final genre = resultRow.readTableOrNull(genres);

          previousValue.update(movie!.id, (value) {
            return MovieExpand(movie: movie, genres: genre == null ? value.genres : [...?value.genres, genre]);
          }, ifAbsent: () {
            return MovieExpand(movie: movie, genres: genre == null ? [] : [genre]);
          });

          return previousValue;
        })
        .values
        .toList();
  }

  Future<void> updateMoviesOnPage(int page, List<Map<String, dynamic>> movies) async {
    List<Movie> currentMoviesOnPage = await getMoviesFromPage(page);

    if (currentMoviesOnPage.isNotEmpty) {
      await deleteMoviesFromPage(currentMoviesOnPage);
    }

    for (Map<String, dynamic> movieMap in movies) {
      await insertMovieInfo(movieMap, page);
    }
  }

  Future<List<Movie>> getMoviesFromPage(int page) async {
    return await (select(movies)..where((table) => table.page.equals(page))).get();
  }

  Future<void> deleteMoviesFromPage(List<Movie> moviesOnPage) async {
    for (Movie movie in moviesOnPage) {
      await deleteMovie(movie.id);
      await dataBase.moviesGenresDao.deleteReletedRows(movie.id);
    }
  }

  Future<void> insertMovieInfo(Map<String, dynamic> movieMap, int page) async {
    movieMap.putIfAbsent('page', () => page);

    int id = await insertMovie(Movie.fromJson(movieMap).toCompanion(true));

    if (movieMap['genres'] != null) {
      await dataBase.genresDao.updateMovieGenres(id, movieMap['genres']);
    }
  }

  Future<int> deleteMovie(int id) async {
    return (delete(movies)..where((table) => table.id.equals(id))).go();
  }

  Future<int> insertMovie(MoviesCompanion companion) async {
    return await into(movies).insert(companion, mode: InsertMode.replace);
  }
}

@DriftAccessor(tables: [Movies, Genres, MoviesGenres])
class GenresDao extends DatabaseAccessor<MoviesDataBase> with _$GenresDaoMixin {
  final MoviesDataBase dataBase;

  GenresDao(this.dataBase) : super(dataBase);

  Future<void> updateMovieGenres(int movieId, List<String> genres) async {
    for (String genreName in genres) {
      int genreId = await getGenreByName(genreName);
      await dataBase.moviesGenresDao.insertMovieGenre(movieId, genreId);
    }
  }

  Future<int> getGenreByName(String genreName) async {
    Genre? genre = await (select(genres)..where((table) => table.name.equals(genreName))).getSingleOrNull();
    return genre == null ? await insertGenre(GenresCompanion(name: Value(genreName))) : genre.id;
  }

  Future<int> insertGenre(GenresCompanion companion) async {
    return await into(genres).insert(companion, mode: InsertMode.replace);
  }
}

@DriftAccessor(tables: [Movies, Genres, MoviesGenres])
class MoviesGenresDao extends DatabaseAccessor<MoviesDataBase> with _$MoviesGenresDaoMixin {
  final MoviesDataBase dataBase;

  MoviesGenresDao(this.dataBase) : super(dataBase);

  Future<int> insertMovieGenre(movieId, genreId) async {
    return await into(moviesGenres)
        .insert(MoviesGenresCompanion(movie: Value(movieId), genre: Value(genreId)), mode: InsertMode.replace);
  }

  Future<void> deleteReletedRows(int movieId) async {
    final rows = await (select(moviesGenres)..where((table) => table.movie.equals(movieId))).get();

    for (MovieGenre row in rows) {
      await (delete(moviesGenres)..where((table) => table.id.equals(row.id))).go();
    }
  }
}

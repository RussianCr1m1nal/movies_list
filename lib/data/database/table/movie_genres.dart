import 'package:drift/drift.dart';
import 'package:movies_list/data/database/table/genres.dart';
import 'package:movies_list/data/database/table/movies.dart';


@DataClassName("MovieGenre")
class MoviesGenres extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get movie => integer().references(Movies, #id)();
  IntColumn get genre => integer().references(Genres, #id)();

  @override
  Set<Column> get primaryKey => {id};
}

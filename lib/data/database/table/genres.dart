import 'package:drift/drift.dart';

@DataClassName("Genre")
class Genres extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();

  @override
  Set<Column> get primaryKey => {id};
}
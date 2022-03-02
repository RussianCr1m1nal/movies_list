
import 'package:drift/drift.dart';

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
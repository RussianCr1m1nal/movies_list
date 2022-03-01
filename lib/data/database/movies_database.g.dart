// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Movie extends DataClass implements Insertable<Movie> {
  final int id;
  final int runtime;
  final int page;
  final String overview;
  final String title;
  final String posterPath;
  final double voteAverage;
  final DateTime? releaseDate;
  Movie(
      {required this.id,
      required this.runtime,
      required this.page,
      required this.overview,
      required this.title,
      required this.posterPath,
      required this.voteAverage,
      this.releaseDate});
  factory Movie.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Movie(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      runtime: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}runtime'])!,
      page: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}page'])!,
      overview: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}overview'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}original_title'])!,
      posterPath: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}poster_path'])!,
      voteAverage: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}vote_average'])!,
      releaseDate: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}release_date']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['runtime'] = Variable<int>(runtime);
    map['page'] = Variable<int>(page);
    map['overview'] = Variable<String>(overview);
    map['original_title'] = Variable<String>(title);
    map['poster_path'] = Variable<String>(posterPath);
    map['vote_average'] = Variable<double>(voteAverage);
    if (!nullToAbsent || releaseDate != null) {
      map['release_date'] = Variable<DateTime?>(releaseDate);
    }
    return map;
  }

  MoviesCompanion toCompanion(bool nullToAbsent) {
    return MoviesCompanion(
      id: Value(id),
      runtime: Value(runtime),
      page: Value(page),
      overview: Value(overview),
      title: Value(title),
      posterPath: Value(posterPath),
      voteAverage: Value(voteAverage),
      releaseDate: releaseDate == null && nullToAbsent
          ? const Value.absent()
          : Value(releaseDate),
    );
  }

  factory Movie.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Movie(
      id: serializer.fromJson<int>(json['id']),
      runtime: serializer.fromJson<int>(json['runtime']),
      page: serializer.fromJson<int>(json['page']),
      overview: serializer.fromJson<String>(json['overview']),
      title: serializer.fromJson<String>(json['original_title']),
      posterPath: serializer.fromJson<String>(json['poster_path']),
      voteAverage: serializer.fromJson<double>(json['vote_average']),
      releaseDate: serializer.fromJson<DateTime?>(json['release_date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'runtime': serializer.toJson<int>(runtime),
      'page': serializer.toJson<int>(page),
      'overview': serializer.toJson<String>(overview),
      'original_title': serializer.toJson<String>(title),
      'poster_path': serializer.toJson<String>(posterPath),
      'vote_average': serializer.toJson<double>(voteAverage),
      'release_date': serializer.toJson<DateTime?>(releaseDate),
    };
  }

  Movie copyWith(
          {int? id,
          int? runtime,
          int? page,
          String? overview,
          String? title,
          String? posterPath,
          double? voteAverage,
          DateTime? releaseDate}) =>
      Movie(
        id: id ?? this.id,
        runtime: runtime ?? this.runtime,
        page: page ?? this.page,
        overview: overview ?? this.overview,
        title: title ?? this.title,
        posterPath: posterPath ?? this.posterPath,
        voteAverage: voteAverage ?? this.voteAverage,
        releaseDate: releaseDate ?? this.releaseDate,
      );
  @override
  String toString() {
    return (StringBuffer('Movie(')
          ..write('id: $id, ')
          ..write('runtime: $runtime, ')
          ..write('page: $page, ')
          ..write('overview: $overview, ')
          ..write('title: $title, ')
          ..write('posterPath: $posterPath, ')
          ..write('voteAverage: $voteAverage, ')
          ..write('releaseDate: $releaseDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, runtime, page, overview, title, posterPath, voteAverage, releaseDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Movie &&
          other.id == this.id &&
          other.runtime == this.runtime &&
          other.page == this.page &&
          other.overview == this.overview &&
          other.title == this.title &&
          other.posterPath == this.posterPath &&
          other.voteAverage == this.voteAverage &&
          other.releaseDate == this.releaseDate);
}

class MoviesCompanion extends UpdateCompanion<Movie> {
  final Value<int> id;
  final Value<int> runtime;
  final Value<int> page;
  final Value<String> overview;
  final Value<String> title;
  final Value<String> posterPath;
  final Value<double> voteAverage;
  final Value<DateTime?> releaseDate;
  const MoviesCompanion({
    this.id = const Value.absent(),
    this.runtime = const Value.absent(),
    this.page = const Value.absent(),
    this.overview = const Value.absent(),
    this.title = const Value.absent(),
    this.posterPath = const Value.absent(),
    this.voteAverage = const Value.absent(),
    this.releaseDate = const Value.absent(),
  });
  MoviesCompanion.insert({
    this.id = const Value.absent(),
    required int runtime,
    required int page,
    required String overview,
    required String title,
    required String posterPath,
    required double voteAverage,
    this.releaseDate = const Value.absent(),
  })  : runtime = Value(runtime),
        page = Value(page),
        overview = Value(overview),
        title = Value(title),
        posterPath = Value(posterPath),
        voteAverage = Value(voteAverage);
  static Insertable<Movie> custom({
    Expression<int>? id,
    Expression<int>? runtime,
    Expression<int>? page,
    Expression<String>? overview,
    Expression<String>? title,
    Expression<String>? posterPath,
    Expression<double>? voteAverage,
    Expression<DateTime?>? releaseDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (runtime != null) 'runtime': runtime,
      if (page != null) 'page': page,
      if (overview != null) 'overview': overview,
      if (title != null) 'original_title': title,
      if (posterPath != null) 'poster_path': posterPath,
      if (voteAverage != null) 'vote_average': voteAverage,
      if (releaseDate != null) 'release_date': releaseDate,
    });
  }

  MoviesCompanion copyWith(
      {Value<int>? id,
      Value<int>? runtime,
      Value<int>? page,
      Value<String>? overview,
      Value<String>? title,
      Value<String>? posterPath,
      Value<double>? voteAverage,
      Value<DateTime?>? releaseDate}) {
    return MoviesCompanion(
      id: id ?? this.id,
      runtime: runtime ?? this.runtime,
      page: page ?? this.page,
      overview: overview ?? this.overview,
      title: title ?? this.title,
      posterPath: posterPath ?? this.posterPath,
      voteAverage: voteAverage ?? this.voteAverage,
      releaseDate: releaseDate ?? this.releaseDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (runtime.present) {
      map['runtime'] = Variable<int>(runtime.value);
    }
    if (page.present) {
      map['page'] = Variable<int>(page.value);
    }
    if (overview.present) {
      map['overview'] = Variable<String>(overview.value);
    }
    if (title.present) {
      map['original_title'] = Variable<String>(title.value);
    }
    if (posterPath.present) {
      map['poster_path'] = Variable<String>(posterPath.value);
    }
    if (voteAverage.present) {
      map['vote_average'] = Variable<double>(voteAverage.value);
    }
    if (releaseDate.present) {
      map['release_date'] = Variable<DateTime?>(releaseDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MoviesCompanion(')
          ..write('id: $id, ')
          ..write('runtime: $runtime, ')
          ..write('page: $page, ')
          ..write('overview: $overview, ')
          ..write('title: $title, ')
          ..write('posterPath: $posterPath, ')
          ..write('voteAverage: $voteAverage, ')
          ..write('releaseDate: $releaseDate')
          ..write(')'))
        .toString();
  }
}

class $MoviesTable extends Movies with TableInfo<$MoviesTable, Movie> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MoviesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _runtimeMeta = const VerificationMeta('runtime');
  @override
  late final GeneratedColumn<int?> runtime = GeneratedColumn<int?>(
      'runtime', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _pageMeta = const VerificationMeta('page');
  @override
  late final GeneratedColumn<int?> page = GeneratedColumn<int?>(
      'page', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _overviewMeta = const VerificationMeta('overview');
  @override
  late final GeneratedColumn<String?> overview = GeneratedColumn<String?>(
      'overview', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'original_title', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _posterPathMeta = const VerificationMeta('posterPath');
  @override
  late final GeneratedColumn<String?> posterPath = GeneratedColumn<String?>(
      'poster_path', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _voteAverageMeta =
      const VerificationMeta('voteAverage');
  @override
  late final GeneratedColumn<double?> voteAverage = GeneratedColumn<double?>(
      'vote_average', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _releaseDateMeta =
      const VerificationMeta('releaseDate');
  @override
  late final GeneratedColumn<DateTime?> releaseDate =
      GeneratedColumn<DateTime?>('release_date', aliasedName, true,
          type: const IntType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        runtime,
        page,
        overview,
        title,
        posterPath,
        voteAverage,
        releaseDate
      ];
  @override
  String get aliasedName => _alias ?? 'movies';
  @override
  String get actualTableName => 'movies';
  @override
  VerificationContext validateIntegrity(Insertable<Movie> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('runtime')) {
      context.handle(_runtimeMeta,
          runtime.isAcceptableOrUnknown(data['runtime']!, _runtimeMeta));
    } else if (isInserting) {
      context.missing(_runtimeMeta);
    }
    if (data.containsKey('page')) {
      context.handle(
          _pageMeta, page.isAcceptableOrUnknown(data['page']!, _pageMeta));
    } else if (isInserting) {
      context.missing(_pageMeta);
    }
    if (data.containsKey('overview')) {
      context.handle(_overviewMeta,
          overview.isAcceptableOrUnknown(data['overview']!, _overviewMeta));
    } else if (isInserting) {
      context.missing(_overviewMeta);
    }
    if (data.containsKey('original_title')) {
      context.handle(_titleMeta,
          title.isAcceptableOrUnknown(data['original_title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('poster_path')) {
      context.handle(
          _posterPathMeta,
          posterPath.isAcceptableOrUnknown(
              data['poster_path']!, _posterPathMeta));
    } else if (isInserting) {
      context.missing(_posterPathMeta);
    }
    if (data.containsKey('vote_average')) {
      context.handle(
          _voteAverageMeta,
          voteAverage.isAcceptableOrUnknown(
              data['vote_average']!, _voteAverageMeta));
    } else if (isInserting) {
      context.missing(_voteAverageMeta);
    }
    if (data.containsKey('release_date')) {
      context.handle(
          _releaseDateMeta,
          releaseDate.isAcceptableOrUnknown(
              data['release_date']!, _releaseDateMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Movie map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Movie.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $MoviesTable createAlias(String alias) {
    return $MoviesTable(attachedDatabase, alias);
  }
}

class Genre extends DataClass implements Insertable<Genre> {
  final int id;
  final String name;
  Genre({required this.id, required this.name});
  factory Genre.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Genre(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  GenresCompanion toCompanion(bool nullToAbsent) {
    return GenresCompanion(
      id: Value(id),
      name: Value(name),
    );
  }

  factory Genre.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Genre(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  Genre copyWith({int? id, String? name}) => Genre(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('Genre(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Genre && other.id == this.id && other.name == this.name);
}

class GenresCompanion extends UpdateCompanion<Genre> {
  final Value<int> id;
  final Value<String> name;
  const GenresCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  GenresCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<Genre> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  GenresCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return GenresCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GenresCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $GenresTable extends Genres with TableInfo<$GenresTable, Genre> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GenresTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? 'genres';
  @override
  String get actualTableName => 'genres';
  @override
  VerificationContext validateIntegrity(Insertable<Genre> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Genre map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Genre.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $GenresTable createAlias(String alias) {
    return $GenresTable(attachedDatabase, alias);
  }
}

class MovieGenre extends DataClass implements Insertable<MovieGenre> {
  final int id;
  final int movie;
  final int genre;
  MovieGenre({required this.id, required this.movie, required this.genre});
  factory MovieGenre.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return MovieGenre(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      movie: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}movie'])!,
      genre: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}genre'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['movie'] = Variable<int>(movie);
    map['genre'] = Variable<int>(genre);
    return map;
  }

  MoviesGenresCompanion toCompanion(bool nullToAbsent) {
    return MoviesGenresCompanion(
      id: Value(id),
      movie: Value(movie),
      genre: Value(genre),
    );
  }

  factory MovieGenre.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MovieGenre(
      id: serializer.fromJson<int>(json['id']),
      movie: serializer.fromJson<int>(json['movie']),
      genre: serializer.fromJson<int>(json['genre']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'movie': serializer.toJson<int>(movie),
      'genre': serializer.toJson<int>(genre),
    };
  }

  MovieGenre copyWith({int? id, int? movie, int? genre}) => MovieGenre(
        id: id ?? this.id,
        movie: movie ?? this.movie,
        genre: genre ?? this.genre,
      );
  @override
  String toString() {
    return (StringBuffer('MovieGenre(')
          ..write('id: $id, ')
          ..write('movie: $movie, ')
          ..write('genre: $genre')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, movie, genre);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MovieGenre &&
          other.id == this.id &&
          other.movie == this.movie &&
          other.genre == this.genre);
}

class MoviesGenresCompanion extends UpdateCompanion<MovieGenre> {
  final Value<int> id;
  final Value<int> movie;
  final Value<int> genre;
  const MoviesGenresCompanion({
    this.id = const Value.absent(),
    this.movie = const Value.absent(),
    this.genre = const Value.absent(),
  });
  MoviesGenresCompanion.insert({
    this.id = const Value.absent(),
    required int movie,
    required int genre,
  })  : movie = Value(movie),
        genre = Value(genre);
  static Insertable<MovieGenre> custom({
    Expression<int>? id,
    Expression<int>? movie,
    Expression<int>? genre,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (movie != null) 'movie': movie,
      if (genre != null) 'genre': genre,
    });
  }

  MoviesGenresCompanion copyWith(
      {Value<int>? id, Value<int>? movie, Value<int>? genre}) {
    return MoviesGenresCompanion(
      id: id ?? this.id,
      movie: movie ?? this.movie,
      genre: genre ?? this.genre,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (movie.present) {
      map['movie'] = Variable<int>(movie.value);
    }
    if (genre.present) {
      map['genre'] = Variable<int>(genre.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MoviesGenresCompanion(')
          ..write('id: $id, ')
          ..write('movie: $movie, ')
          ..write('genre: $genre')
          ..write(')'))
        .toString();
  }
}

class $MoviesGenresTable extends MoviesGenres
    with TableInfo<$MoviesGenresTable, MovieGenre> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MoviesGenresTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _movieMeta = const VerificationMeta('movie');
  @override
  late final GeneratedColumn<int?> movie = GeneratedColumn<int?>(
      'movie', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: true,
      defaultConstraints: 'REFERENCES movies (id)');
  final VerificationMeta _genreMeta = const VerificationMeta('genre');
  @override
  late final GeneratedColumn<int?> genre = GeneratedColumn<int?>(
      'genre', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: true,
      defaultConstraints: 'REFERENCES genres (id)');
  @override
  List<GeneratedColumn> get $columns => [id, movie, genre];
  @override
  String get aliasedName => _alias ?? 'movies_genres';
  @override
  String get actualTableName => 'movies_genres';
  @override
  VerificationContext validateIntegrity(Insertable<MovieGenre> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('movie')) {
      context.handle(
          _movieMeta, movie.isAcceptableOrUnknown(data['movie']!, _movieMeta));
    } else if (isInserting) {
      context.missing(_movieMeta);
    }
    if (data.containsKey('genre')) {
      context.handle(
          _genreMeta, genre.isAcceptableOrUnknown(data['genre']!, _genreMeta));
    } else if (isInserting) {
      context.missing(_genreMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MovieGenre map(Map<String, dynamic> data, {String? tablePrefix}) {
    return MovieGenre.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $MoviesGenresTable createAlias(String alias) {
    return $MoviesGenresTable(attachedDatabase, alias);
  }
}

abstract class _$MoviesDataBase extends GeneratedDatabase {
  _$MoviesDataBase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $MoviesTable movies = $MoviesTable(this);
  late final $GenresTable genres = $GenresTable(this);
  late final $MoviesGenresTable moviesGenres = $MoviesGenresTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [movies, genres, moviesGenres];
}

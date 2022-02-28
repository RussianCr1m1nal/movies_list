// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie(
      title: json['original_title'] as String,
      overview: json['overview'] as String,
      releaseDate: json['release_date'] == null
          ? null
          : DateTime.parse(json['release_date'] as String),
      genres:
          (json['genres'] as List<dynamic>).map((e) => e as String).toList(),
      posterPath: json['poster_path'] as String,
      voteAverage: (json['vote_average'] as num).toDouble(),
      runtime: json['runtime'] as int,
    );

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'title': instance.title,
      'overview': instance.overview,
      'releaseDate': instance.releaseDate?.toIso8601String(),
      'genres': instance.genres,
      'posterPath': instance.posterPath,
      'voteAverage': instance.voteAverage,
      'runtime': instance.runtime,
    };

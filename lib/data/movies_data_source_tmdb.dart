import 'dart:convert';

import 'package:movies_list/data/movies_data_source.dart';
import 'package:http/http.dart' as http;

class MoviesDataSourceTMDB extends MoviesDataSource {
  final String _apiKey;

  MoviesDataSourceTMDB(this._apiKey);

  @override
  Future<List<Map<String, dynamic>>> getMoviesFromPage(int page) async {
    var url = Uri.https('api.themoviedb.org', '/3/discover/movie',
        {'api_key': _apiKey, 'sort_by': 'popularity.desc', 'page': page.toString()});
    final response = await http.get(url);

    if (response.statusCode == 200) {
      List<Map<String, dynamic>> movies = [];

      for (Map<String, dynamic> movie in jsonDecode(response.body)['results']) {
        movies.add(await _getMovieById(movie['id']));
      }

      return movies;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future<Map<String, dynamic>> _getMovieById(int id) async {
    var url = Uri.https('api.themoviedb.org', '/3/movie/$id', {'api_key': _apiKey});
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return _convertFromJson(jsonDecode(response.body));
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Map<String, dynamic> _convertFromJson(dynamic jsonMap) {
    return Map<String, dynamic>.from(jsonMap.map((key, value) {
      switch (key) {
        case 'poster_path':
          return MapEntry(key, 'https://image.tmdb.org/t/p/original' + value);
        case 'genres':
          return MapEntry(key, List<String>.from(value.map((genre) => genre['name'] as String).toList()));
        case 'release_date':
          return MapEntry(key, DateTime.tryParse(value));
        default:
          return MapEntry(key, value);
      }
    }));
  }
}

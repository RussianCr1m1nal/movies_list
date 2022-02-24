import 'dart:convert';

import 'package:http/http.dart' as http;

abstract class MoviesDataSource {
  Future<List<dynamic>> getMoviesFromPage(int page);
}

class MoviesDataSourceTMDB extends MoviesDataSource {
  final String _apiKey;

  MoviesDataSourceTMDB(this._apiKey);

  @override
  Future<List<dynamic>> getMoviesFromPage(int page) async {
    var url = Uri.https('api.themoviedb.org', '/3/discover/movie',
        {'api_key': _apiKey, 'sort_by': 'popularity.desc', 'page': page.toString()});
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['results'].map(_convertFromJson).toList();
    } else {
      throw Exception(response.body);
    }
  }

  Map<String, dynamic> _convertFromJson(dynamic jsonMap) {
    return Map<String, dynamic>.from(jsonMap.map((key, value) {
      switch (key) {
        case 'poster_path':
          return MapEntry(key, 'https://image.tmdb.org/t/p/original' + value);
        default:
          return MapEntry(key, value);
      }
    }));
  }
}

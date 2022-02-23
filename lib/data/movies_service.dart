import 'dart:convert';

import 'package:http/http.dart' as http;

abstract class MoviesService {
  Future<List<dynamic>> getMoviesFromPage(int page);
}

class MoviesServiceAPI extends MoviesService {
  final String _APIKey;

  MoviesServiceAPI(this._APIKey);

  @override
  Future<List<dynamic>> getMoviesFromPage(int page) async {
    var url = Uri.https('api.themoviedb.org', '/3/discover/movie',
        {'api_key': _APIKey, 'sort_by' : 'popularity.desc', 'page' : page.toString()});
    final response = await http.get(url);
    
    return jsonDecode(response.body)['results'];
  }
}

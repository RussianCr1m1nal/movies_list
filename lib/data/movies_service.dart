import 'package:http/http.dart' as http;

class MoviesService {
  final String _APIKey;

  MoviesService(this._APIKey);

  Future<http.Response> getMovies(int page) async {
    var url = Uri.https('api.themoviedb.org', '/3/discover/movie?sort_by=popularity.desc&page=${page.toString()}&api_key=$_APIKey');
    final response = await http.get(url);
    
    return response;
  }
}

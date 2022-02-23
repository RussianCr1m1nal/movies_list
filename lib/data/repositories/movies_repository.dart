import 'package:movies_list/data/movies_service.dart';
import 'package:movies_list/domain/movie.dart';

class MoviesRepository {

  final MoviesService moviesService;

  MoviesRepository({required this.moviesService});

  Future<List<Movie>> getMoviesFromPage(int page) async{
    List<dynamic> moviesData = await moviesService.getMoviesFromPage(page);

    return moviesData.map((elemet) => Movie.fromJson(elemet)).toList();
  }
}
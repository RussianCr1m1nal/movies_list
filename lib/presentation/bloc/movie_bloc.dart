
import 'package:movies_list/domain/entities/movie.dart';
import 'package:rxdart/rxdart.dart';

class MovieBloc {

  final Movie movie;

  final _movieStream = BehaviorSubject<Movie>();
  Stream<Movie> get stream => _movieStream.stream;

  MovieBloc({required this.movie}) {
    _movieStream.add(movie);
  }

  void dispose() {
    _movieStream.close();
  }
}
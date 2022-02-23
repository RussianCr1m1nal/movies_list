import 'dart:async';

import 'package:movies_list/domain/movie.dart';
import 'package:movies_list/domain/usecases/get_movies_from_page.dart';
import 'package:rxdart/rxdart.dart';

class MoviesBloc {

  final GetMoviesFromPageUseCase getMoviesFromPageUseCase;

  final _moviesStream = BehaviorSubject<List<Movie>>.seeded([]);
  Stream<List<Movie>> get stream => _moviesStream.stream;

  StreamController _actionController = StreamController();
  StreamSink get loadMovies => _actionController.sink;

  MoviesBloc({required this.getMoviesFromPageUseCase}) {
    _actionController.stream.listen(_addToStreamFromUseCase);
    _addToStreamFromUseCase(1);
  }

  void _addToStreamFromUseCase(page) async{
    _addToStream(await getMoviesFromPageUseCase(page));
  }

  void _addToStream(List<Movie> movies) {
    _moviesStream.add([..._moviesStream.value,  ...movies]);
  }

  void dispose() {
    _moviesStream.close();
    _actionController.close();
  }
}
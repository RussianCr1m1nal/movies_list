import 'dart:async';

import 'package:movies_list/domain/movie.dart';
import 'package:rxdart/rxdart.dart';

class MoviesBloc {

  final _moviesStream = BehaviorSubject<List<Movie>>();

  Stream<List<Movie>> get stream => _moviesStream.stream;


  MoviesBloc() {
    _changeStream([
      Movie('123', '123', DateTime(2022, 02, 22), [], '_posterPath', 1.1), 
      Movie('qwe', 'qwe', DateTime(2022, 02, 22), [], 'asdf', 1.2),
    ]);
  }

  void _changeStream(data) {
    _moviesStream.add(data);
    print(data.toString());
  }
}
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:movies_list/domain/entities/movie.dart';
import 'package:movies_list/domain/usecases/get_movies_from_page.dart';
import 'package:movies_list/domain/usecases/update_movies_usecase.dart';
import 'package:movies_list/domain/usecases/watch_movies_usecase.dart';
import 'package:rxdart/rxdart.dart';

class MoviesBloc {
  final GetMoviesFromPageUseCase getMoviesFromPageUseCase;
  final WatchMoviesUseCase watchMoviesUseCase;
  final UpdateMoviesOnPageUseCase updateMoviesOnPageUseCase;

  final _moviesOnPageSubject = BehaviorSubject<List<Movie>>.seeded([]);
  StreamSubscription? _moviesSubscription;

  Stream<List<Movie>> get stream => _moviesOnPageSubject.stream;
  
  final scrollController = ScrollController();

  int currentPage = 1;

  MoviesBloc(
      {required this.getMoviesFromPageUseCase,
      required this.watchMoviesUseCase,
      required this.updateMoviesOnPageUseCase}) {
    loadMovies(currentPage);
  }

  void nextPage() {
    loadMovies(++currentPage);

    if (scrollController.positions.isNotEmpty) {
      scrollController.jumpTo(0);
    }
  }

  void previousPage() {
    if (currentPage == 1) {
      return;
    }

    loadMovies(--currentPage);

    if (scrollController.positions.isNotEmpty) {
      scrollController.jumpTo(0);
    }
  }

  Future<void> loadMovies(int page) async {
    (await watchMoviesUseCase(page)).fold((failure) {
      print(failure.message);
    }, (moviesStream) {
      _moviesSubscription?.cancel();
      _moviesSubscription = moviesStream.listen((movies) {
        _addToStream(movies);
      });
    });

    updateMoviesOnPageUseCase(page);
  }

  void _addToStream(List<Movie> movies) {
    _moviesOnPageSubject.add(movies);
  }

  void dispose() {
    _moviesSubscription?.cancel();
    _moviesOnPageSubject.close();
    scrollController.dispose();
  }
}

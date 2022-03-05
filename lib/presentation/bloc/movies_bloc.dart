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

  final _moviesSubject = BehaviorSubject<List<Movie>>.seeded([]);
  late StreamSubscription _moviesSubscription;

  final _moviesOnPageSubject = BehaviorSubject<List<Movie>>.seeded([]);
  Stream<List<Movie>> get stream => _moviesOnPageSubject.stream;

  int currentPage = 1;

  final pageController = PageController();

  MoviesBloc(
      {required this.getMoviesFromPageUseCase,
      required this.watchMoviesUseCase,
      required this.updateMoviesOnPageUseCase}) {
    _watchMovies();
  }

  Future<void> _watchMovies() async {
    (await watchMoviesUseCase()).fold((failure) {
      print(failure.message);
    }, (moviesStream) {
      // _moviesSubscription.cancel();
      _moviesSubscription = moviesStream.listen((movies) {
        _moviesSubject.add(movies);
      });
      loadMovies(currentPage);
    });
  }

  void nextPage() {
    loadMovies(++currentPage);
    pageController.jumpToPage(currentPage - 1);
  }

  void previousPage() {
    if (currentPage == 1) {
      return;
    }

    loadMovies(--currentPage);
    pageController.jumpToPage(currentPage - 1);
  }

  Future<void> loadMovies(int page) async {    
    updateMoviesOnPageUseCase(page);

    _moviesSubscription = _moviesSubject.listen((value) {
      List<Movie> result = [];

      value.where((element) => element.page == page).forEach((element) {
        result.add(element);
      });

      _addToStream(result);
    });
  }

  void _addToStream(List<Movie> movies) {
    _moviesOnPageSubject.add(movies);
  }

  void dispose() {
    _moviesSubscription.cancel();
    _moviesSubject.close();
    _moviesOnPageSubject.close();
    pageController.dispose();
  }
}

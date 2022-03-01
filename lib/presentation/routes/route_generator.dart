
import 'package:flutter/material.dart';
import 'package:movies_list/domain/entities/movie.dart';
import 'package:movies_list/presentation/screens/movie_screen.dart';
import 'package:movies_list/presentation/screens/movies_list_screen.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;

    switch (settings.name) {
      case MoviesListScreeen.routeName:
        return MaterialPageRoute(builder: (_) => const MoviesListScreeen());
      case MovieScreen.routeName:
        return MaterialPageRoute(builder: (_) => MovieScreen(movie: arguments as Movie));
      default:
        throw Exception('Unknown route name');
    }
  }
}
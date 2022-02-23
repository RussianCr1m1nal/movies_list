import 'package:flutter/material.dart';
import 'package:movies_list/locator.dart';
import 'package:movies_list/presentation/screens/movies_list_view.dart';

void main() {
  setup();
  runApp(const MoviesApp());
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies list',
      home: MoviesListView(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:movies_list/presentation/movies_list_view.dart';

void main() {
  runApp(const MoviesApp());
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Movies list',
      home: MoviesListView(),
    );
  }
}

import 'dart:html';

import 'package:flutter/material.dart';
import 'package:movies_list/domain/movie.dart';
import 'package:movies_list/domain/movies_bloc.dart';
import 'package:provider/provider.dart';

class MoviesListView extends StatelessWidget {
  const MoviesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<MoviesBloc>(create: (_) => MoviesBloc()),
      ],
      child: Scaffold(
        body: SafeArea(
            child: Consumer<MoviesBloc>(
              builder: ((context, _moviesBloc, child) {
                return StreamBuilder<List<Movie>>(
                  stream: _moviesBloc.stream,
                  builder: ((context, snapshot) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                      return ListTile(title: Text(snapshot.data![index].title),);
                    }, );
                  }),
                );
              }),
            ),
          ),
      ),
    );
  }
}

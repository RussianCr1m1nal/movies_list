import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movies_list/domain/movie.dart';
import 'package:movies_list/presentation/bloc/movie_bloc.dart';
import 'package:provider/provider.dart';

class MovieScreen extends StatelessWidget {
  static const String routeName = '/movie';

  const MovieScreen({Key? key, required this.movie}) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<MovieBloc>(
          create: (_) => MovieBloc(),
          dispose: (context, movieBloc) {
            movieBloc.dispose();
          },
        )
      ],
      child: Scaffold(
        appBar: AppBar(title: Text(movie.title)),
        body: Consumer<MovieBloc>(builder: (context, movieBloc, child) {
          return StreamBuilder<Movie>(builder: ((context, snapshot) {
            return CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Flex(
                    direction: Axis.vertical,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              image: DecorationImage(fit: BoxFit.cover, image: NetworkImage(movie.posterPath))),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10.0),
                                child: Text(
                                  movie.title,
                                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                                ),
                              ),
                              Text(
                                movie.overview,
                                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                                textAlign: TextAlign.justify,
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 10.0),
                                child: Text(
                                  'Release',
                                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                                ),
                              ),
                              Text(
                                movie.releaseDate,
                                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                                textAlign: TextAlign.justify,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          }));
        }),
      ),
    );
  }
}

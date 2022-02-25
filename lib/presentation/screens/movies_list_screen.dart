import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_list/domain/entities/movie.dart';
import 'package:movies_list/domain/usecases/get_movies_from_page.dart';
import 'package:movies_list/presentation/bloc/movies_bloc.dart';
import 'package:movies_list/presentation/widgets/movie_card.dart';
import 'package:provider/provider.dart';

class MoviesListScreeen extends StatelessWidget {
  static const String routeName = '/';

  MoviesListScreeen({Key? key}) : super(key: key);

  int currentPage = 1;
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<MoviesBloc>(
          create: (_) {
            MoviesBloc moviesBloc = MoviesBloc(getMoviesFromPageUseCase: GetIt.I<GetMoviesFromPageUseCase>());

            _scrollController.addListener(() async {
              if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
                await moviesBloc.loadMovies(++currentPage);
              }
            });

            return moviesBloc;
          },
          dispose: (context, moviesBloc) {
            moviesBloc.dispose();
            _scrollController.dispose();
          },
        ),
      ],
      child: Scaffold(
        body: SafeArea(
          child: Consumer<MoviesBloc>(
            builder: ((context, _moviesBloc, child) {
              return StreamBuilder<List<Movie>>(
                stream: _moviesBloc.stream,
                builder: ((context, snapshot) {
                  List<Movie> movies = snapshot.data ?? [];

                  return ListView.builder(
                    itemCount: movies.length,
                    itemBuilder: (context, index) {
                      return MovieCard(movie: movies[index]);
                    },
                    controller: _scrollController,
                  );
                }),
              );
            }),
          ),
        ),
      ),
    );
  }
}
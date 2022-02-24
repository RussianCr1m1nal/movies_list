import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_list/domain/movie.dart';
import 'package:movies_list/domain/usecases/get_movies_from_page.dart';
import 'package:movies_list/presentation/bloc/movies_bloc.dart';
import 'package:movies_list/presentation/widgets/movie_card.dart';
import 'package:provider/provider.dart';

class MoviesListScreeen extends StatelessWidget {

  static const String routeName = '/';

  MoviesListScreeen({Key? key}) : super(key: key);

  int currentPage = 1;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<MoviesBloc>(
          create: (_) => MoviesBloc(getMoviesFromPageUseCase: GetIt.I<GetMoviesFromPageUseCase>()),
          dispose: (context, moviesBloc) {
            moviesBloc.dispose();
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
                  ScrollController _scrollController = ScrollController();

                  return NotificationListener<ScrollNotification>(
                    onNotification: (ScrollNotification notification) {
                      if (notification.metrics.pixels == notification.metrics.maxScrollExtent) {
                        _moviesBloc.loadMovies(++currentPage);
                      }

                      return false;
                    },
                    child: ListView.builder(
                      itemCount: movies.length,                                            
                      itemBuilder: (context, index) {
                        return MovieCard(movie: movies[index]);                       
                      },
                      controller: _scrollController,
                    ),
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

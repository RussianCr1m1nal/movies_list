import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_list/domain/entities/movie.dart';
import 'package:movies_list/domain/usecases/get_movies_from_page.dart';
import 'package:movies_list/domain/usecases/update_movies_usecase.dart';
import 'package:movies_list/domain/usecases/watch_movies_usecase.dart';
import 'package:movies_list/presentation/bloc/movies_bloc.dart';
import 'package:movies_list/presentation/widgets/movie_card.dart';
import 'package:provider/provider.dart';

class MoviesListScreeen extends StatelessWidget {
  static const String routeName = '/';

  const MoviesListScreeen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<MoviesBloc>(
          create: (_) => MoviesBloc(
            getMoviesFromPageUseCase: GetIt.I<GetMoviesFromPageUseCase>(),
            watchMoviesUseCase: GetIt.I<WatchMoviesUseCase>(),
            updateMoviesOnPageUseCase: GetIt.I<UpdateMoviesOnPageUseCase>(),
          ),
          dispose: (context, moviesBloc) {
            moviesBloc.dispose();
          },
        ),
      ],
      child: Consumer<MoviesBloc>(
        builder: (context, _moviesBloc, child) {
          return StreamBuilder<List<Movie>>(
              stream: _moviesBloc.stream,
              builder: (context, snapshot) {
                List<Movie>? movies = snapshot.data;

                return Scaffold(
                  body: SafeArea(
                    child: Builder(builder: (context) {
                      if (movies == null || movies.isEmpty) {
                        return const Center(
                          child: Text('No movies'),
                        );
                      }

                      return ListView.builder(
                        controller: _moviesBloc.scrollController,
                        itemCount: movies.length,
                        itemBuilder: (context, index) {
                          return MovieCard(movie: movies[index]);
                        },
                      );
                    }),
                  ),
                  bottomNavigationBar: BottomAppBar(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(onPressed: _moviesBloc.previousPage, icon: const Icon(Icons.navigate_before)),
                        Text(_moviesBloc.currentPage.toString()),
                        IconButton(onPressed: _moviesBloc.nextPage, icon: const Icon(Icons.navigate_next)),
                      ],
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}

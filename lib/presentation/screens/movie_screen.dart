import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movies_list/domain/entities/movie.dart';
import 'package:movies_list/presentation/bloc/movie_bloc.dart';
import 'package:movies_list/presentation/widgets/movie_info.dart';
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
          create: (_) => MovieBloc(movie: movie),
          dispose: (context, movieBloc) {
            movieBloc.dispose();
          },
        )
      ],
      child: Consumer<MovieBloc>(builder: (context, movieBloc, child) {
        return StreamBuilder<Movie>(
            stream: movieBloc.stream,
            builder: ((context, snapshot) {
              final _movie = snapshot.data;

              if (_movie == null) {
                return Scaffold(
                  appBar: AppBar(
                    title: const Text('Not found'),
                  ),
                  body: const Center(child: Text('Faild loading movie')),
                );
              }

              return Scaffold(
                appBar: AppBar(title: Text(_movie.title)),
                body: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Column(
                        children: [
                          Container(
                            height: 250,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                image: DecorationImage(
                                    fit: BoxFit.cover, image: CachedNetworkImageProvider(_movie.posterPath))),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RatingBar(
                                  ignoreGestures: true,
                                  initialRating: _movie.voteAverage / 2,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  ratingWidget: RatingWidget(
                                    full: const Icon(Icons.star),
                                    half: const Icon(Icons.star_half_outlined),
                                    empty: const Icon(Icons.star_border),
                                  ),
                                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                                  onRatingUpdate: (rating) {},
                                ),
                                MovieInfo(title: _movie.title, subtitle: _movie.overview),
                                MovieInfo(
                                    title: 'Release',
                                    subtitle: _movie.releaseDate == null
                                        ? ''
                                        : _movie.releaseDate.toString().substring(0, 10)),
                                MovieInfo(
                                    title: 'Genres',
                                    subtitle: _movie.genres.toString().replaceAll(RegExp(r"[\[\]]"), '')),
                                MovieInfo(title: 'Runtime', subtitle: _movie.runtime.toString() + ' min'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }));
      }),
    );
  }
}

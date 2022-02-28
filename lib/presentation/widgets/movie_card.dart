import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_list/domain/entities/movie.dart';
import 'package:movies_list/presentation/screens/movie_screen.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, MovieScreen.routeName, arguments: movie);
          },
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    image: DecorationImage(fit: BoxFit.cover, image: CachedNetworkImageProvider(movie.posterPath)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(movie.title,
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis),
                      Text(
                        movie.overview,
                        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(movie.releaseDate == null ? 'No release date' : movie.releaseDate.toString().substring(0, 10),
                          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                      RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: movie.voteAverage.toString(),
                                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                              ),
                              const WidgetSpan(child: Icon(Icons.star)),
                            ],
                          )),
                    ],
                  ),
                ),
              ],
            ),
            margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0),
          ),
        ),
        const SizedBox(height: 8.0),
      ],
    );
  }
}

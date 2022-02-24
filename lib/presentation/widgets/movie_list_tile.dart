import 'package:flutter/material.dart';
import 'package:movies_list/domain/movie.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        color: Colors.grey[200],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  image: DecorationImage(fit: BoxFit.cover, image: NetworkImage(movie.posterPath))),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis
                  ),
                  Text(movie.overview,
                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 4),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(movie.releaseDate, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
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
            )
          ],
        ),
        margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:new_movie_info_app/components/movie_info_item.dart';
import 'package:new_movie_info_app/models/movie.dart';

class MovieInfo extends StatelessWidget {
  Movie movie;

  MovieInfo(this.movie, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            Container(
              child: movie.poster,
            ),
            const SizedBox(height: 10),
            MovieInfoItem('Title', movie.title),
            MovieInfoItem('Year', movie.year),
            MovieInfoItem('Rated', movie.rated),
            MovieInfoItem('Released', movie.released),
            MovieInfoItem('Runtime', movie.runtime),
            MovieInfoItem('Genre', movie.genre),
            MovieInfoItem('Director', movie.director),
            MovieInfoItem('Writers', movie.writers),
            MovieInfoItem('Actor', movie.actors.toString()),
            MovieInfoItem('Plot', movie.plot),
            MovieInfoItem('Language', movie.languages.toString()),
            MovieInfoItem('Country', movie.country),
            MovieInfoItem('Awards', movie.awards),
            MovieInfoItem('Metascore', movie.metascore),
            MovieInfoItem('IMDB Rating', movie.imdbRating.toString()),
            MovieInfoItem('IMDB Votes', movie.imdbVotes),
            MovieInfoItem('Type', movie.type),
            MovieInfoItem('Total Seasons', movie.totalSeasons.toString()),
          ],
        ),
      ),
    );
  }
}

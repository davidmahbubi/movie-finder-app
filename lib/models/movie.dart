import 'package:flutter/material.dart';

class Movie {
  String title;
  String year;
  String rated;
  String released;
  String runtime;
  String genre;
  String director;
  String writers;
  String plot;
  List<String>? actors;
  List<String>? languages;
  String country;
  String awards;
  String? posters;
  Map<String, String>? ratings;
  String metascore;
  double imdbRating;
  String imdbVotes;
  String type;
  int totalSeasons;

  Movie(
      {this.title = 'N/A',
      this.year = 'N/A',
      this.rated = 'N/A',
      this.released = 'N/A',
      this.runtime = 'N/A',
      this.genre = 'N/A',
      this.director = 'N/A',
      this.writers = 'N/A',
      this.plot = 'N/A',
      this.actors,
      this.languages,
      this.country = 'N/A',
      this.awards = 'N/A',
      this.posters,
      this.ratings,
      this.metascore = 'N/A',
      this.imdbRating = 0.0,
      this.imdbVotes = 'N/A',
      this.type = 'N/A',
      this.totalSeasons = 0});

  Image get poster {
    if (posters == null) {
      return Image.asset('assets/images/no-image.png', height: 200);
    } else {
      return Image.network(posters!, height: 200);
    }
  }
}

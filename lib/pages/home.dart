import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:new_movie_info_app/components/movie_info.dart';
import 'package:new_movie_info_app/components/movie_not_found.dart';
import 'package:new_movie_info_app/components/startup_info.dart';
import 'package:new_movie_info_app/models/movie.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _titleController = TextEditingController();

  Movie? movie;
  bool isLoading = false;
  bool isStart = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Finder App'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 25, left: 25, right: 25),
        child: Column(
          children: <Widget>[
            const Text(
              'Movie Finder',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: const InputDecoration(hintText: 'Input Movie Title'),
              controller: _titleController,
              onSubmitted: (_) async {
                setState(() {
                  isLoading = true;
                  if (isStart) isStart = false;
                });
                http.Response res = await fetchMovieInfo(_titleController.text);
                var result = jsonDecode(res.body);
                setState(() {
                  if (result['Response'] == 'True') {
                    movie = Movie(
                      title: result['Title'],
                      year: result['Year'],
                      rated: result['Rated'],
                      released: result['Released'],
                      runtime: result['Runtime'],
                      genre: result['Genre'],
                      director: result['Director'],
                      writers: result['Writer'],
                      actors: result['Actors'] != 'N/A'
                          ? result['Actors'].toString().split(',')
                          : null,
                      plot: result['Plot'],
                      languages: result['Language'] != 'N/A'
                          ? result['Language'].toString().split(',')
                          : null,
                      country: result['Country'],
                      awards: result['Awards'],
                      posters:
                          result['Poster'] == 'N/A' ? null : result['Poster'],
                      ratings: null,
                      metascore: result['Metascore'],
                      imdbRating: double.parse(result['imdbRating'] == 'N/A'
                          ? '0.0'
                          : result['imdbRating']),
                      imdbVotes: result['imdbVotes'],
                      type: result['Type'],
                      totalSeasons: result['totalSeasons'] != null
                          ? (int.parse(result['totalSeasons'] == 'N/A'
                              ? '0'
                              : result['totalSeasons']))
                          : 0,
                    );
                  } else {
                    movie = null;
                  }

                  isLoading = false;
                });
              },
            ),
            const SizedBox(height: 40),
            isLoading
                ? const CircularProgressIndicator()
                : (movie == null
                    ? (isStart ? const StartupInfo() : const MovieNotFound())
                    : MovieInfo(movie!)),
          ],
        ),
      ),
    );
  }

  Future<http.Response> fetchMovieInfo(String title) {
    return http
        .get(Uri.parse('http://www.omdbapi.com/?apikey=39f6b61f&t=$title'));
  }
}

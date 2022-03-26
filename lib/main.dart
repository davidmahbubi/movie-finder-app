import 'package:flutter/material.dart';
import 'package:new_movie_info_app/pages/home.dart';

void main(List<String> args) => runApp(App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => Home(),
      },
    );
  }
}

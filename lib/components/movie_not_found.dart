import 'package:flutter/material.dart';

class MovieNotFound extends StatelessWidget {
  const MovieNotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/images/blank-canvas.png'),
            const SizedBox(height: 20),
            const Text(
              'Movie\'s Title Not Found !',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}

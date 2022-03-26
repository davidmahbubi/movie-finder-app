import 'package:flutter/material.dart';

class StartupInfo extends StatelessWidget {
  const StartupInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/images/parkinson.png'),
            const SizedBox(height: 20),
            const Text(
              'Input Movie\'s Title to Searchbox Above !',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}

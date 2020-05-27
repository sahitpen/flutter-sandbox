import 'package:flutter/material.dart';
import 'package:flutter_sandbox/screens/home_page.dart';

void main() {
  runApp(PlaygroundApp());
}

class PlaygroundApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Playground',
      theme: ThemeData(
          fontFamily: 'OpenSans',
          scaffoldBackgroundColor: Colors.white,
          primaryColor: Colors.white,
          cardColor: Colors.grey[100]
      ),
      home: HomePage()
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_sandbox/common/constants/app_theme.dart';
import 'package:flutter_sandbox/screens/home_page.dart';

void main() {
  runApp(PlaygroundApp());
}

class PlaygroundApp extends StatelessWidget {
  const PlaygroundApp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Playground',
      theme: AppTheme.theme,
      home: HomePage(),
    );
  }
}

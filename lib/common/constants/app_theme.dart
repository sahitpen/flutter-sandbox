import 'package:flutter/material.dart';

ThemeData configureAppTheme() {
  return ThemeData(
    fontFamily: 'OpenSans',
    accentColor: Color.fromRGBO(187, 144, 249, 1),
    primaryColor: Color.fromRGBO(6, 5, 24, 1),
    primaryColorDark: Colors.black,
    cardColor: Colors.grey[100],
    canvasColor: Colors.white,
    highlightColor: Colors.blueGrey,
  );
}

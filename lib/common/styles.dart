import 'package:flutter/material.dart';

class Styles {
  static const appBarText = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w700,
    fontSize: 25
  );

  static const appBarTextLight = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w700,
    fontSize: 25
  );

  static const headerText = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w100,
      fontSize: 16.0
  );

  static const cardText = TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.w600,
      fontSize: 15.0
  );

  static final cardTextLight = cardText.copyWith(color: Colors.white);
}

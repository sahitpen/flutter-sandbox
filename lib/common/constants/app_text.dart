import 'package:flutter/material.dart';

class AppText {
  static const appBar =
      TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 25);
  static final appBarLight = appBar.copyWith(color: Colors.white);
  static const header = TextStyle(
      color: Colors.black, fontWeight: FontWeight.w300, fontSize: 16.0);
  static final headerLight = header.copyWith(color: Colors.white);
  static final headerAccent =
      header.copyWith(color: Color.fromRGBO(251, 237, 255, 0.9));
  static const subtitle = TextStyle(
      color: Colors.grey, fontWeight: FontWeight.w600, fontSize: 15.0);
  static final subtitleLight = subtitle.copyWith(color: Colors.white);
  static const emptyString = '';
}

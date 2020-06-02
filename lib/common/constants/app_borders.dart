import 'package:flutter/material.dart';

class AppBorders {
  static final rounded = BorderRadius.circular(20.0);
  static const roundedTop = BorderRadius.only(
    topLeft: Radius.circular(30),
    topRight: Radius.circular(30),
  );
}

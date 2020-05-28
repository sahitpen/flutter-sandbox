import 'package:flutter/material.dart';
import 'package:flutter_sandbox/common/styles.dart';

class DemoScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  DemoScaffold({this.title, this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          title,
          style: Styles.appBarText,
        ),
      ),
      body: body,
    );
  }
}
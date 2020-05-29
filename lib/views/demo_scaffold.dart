import 'package:flutter/material.dart';
import 'package:flutter_sandbox/common/constants/app_text.dart';

class DemoScaffold extends StatelessWidget {
  final String title;
  final List<Widget> widgets;
  DemoScaffold({this.title, this.widgets});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).canvasColor,
        iconTheme: IconThemeData(
          color: Theme.of(context).primaryColorDark,
        ),
        title: Text(
          title,
          style: AppText.appBar,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: widgets
      ),
    );
  }
}
import 'package:flutter/cupertino.dart';

class CupertinoWidget extends StatelessWidget {
  final Text title;
  final Text text;
  final Image image;
  final Icon icon;

  CupertinoWidget({this.title, this.text, this.image, this.icon});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(),
        child: Column(children: <Widget>[text, image, icon]),
      ),
    );
  }
}

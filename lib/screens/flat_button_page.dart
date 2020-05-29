import 'package:flutter/material.dart';
import 'package:flutter_sandbox/views/demo_scaffold.dart';
import 'package:flutter_sandbox/views/widget_display.dart';

class FlatButtonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, Widget> buttons = {
      'Basic': FlatButton(
        child: Text('Text Button'),
        onPressed: () {},
      ),
      'Icon': FlatButton(
        color: Theme.of(context).cardColor,
        child: Icon(Icons.person),
        onPressed: () {},
      ),
      'Colored': FlatButton(
        color: Theme.of(context).accentColor,
        child: Text('Colored Button'),
        onPressed: () {},
      ),
      'Splash': FlatButton(
        color: Theme.of(context).primaryColor,
        textColor: Theme.of(context).canvasColor,
        splashColor: Theme.of(context).accentColor,
        child: Text('Splash Color'),
        onPressed: () {},
      ),
    };
    return DemoScaffold(
      title: 'Flat Buttons',
      widgets: createWidgetDisplays(buttons)
    );
  }
}

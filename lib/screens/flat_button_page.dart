import 'package:flutter/material.dart';
import 'package:flutter_sandbox/views/demo_scaffold.dart';
import 'package:flutter_sandbox/views/widget_display.dart';

class FlatButtonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DemoScaffold(
      title: 'Flat Buttons',
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          WidgetDisplay(
            title: 'Basic',
            widget: FlatButton(
              child: Text('Text Button'),
              onPressed: () {},
            ),
          ),
          WidgetDisplay(
            title: 'Colored',
            widget: FlatButton(
              color: Theme.of(context).accentColor,
              child: Text('Colored Button'),
              onPressed: () {},
            ),
          ),
           WidgetDisplay(
            title: 'Splash',
            widget: FlatButton(
              color: Theme.of(context).primaryColor,
              textColor: Theme.of(context).canvasColor,
              splashColor: Theme.of(context).accentColor,
              child: Text('Splash Color'),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}

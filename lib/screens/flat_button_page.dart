import 'package:flutter/material.dart';
import 'package:flutter_sandbox/common/constants/app_theme.dart';
import 'package:flutter_sandbox/views/demo_elements/demo_scaffold.dart';
import 'package:flutter_sandbox/views/widget_elements/widget_display.dart';

class FlatButtonPage extends StatelessWidget {
  static final _theme = AppTheme.theme;
  final buttons = {
    'Basic': FlatButton(
      child: Text('Text Button'),
      onPressed: () {},
    ),
    'Icon': FlatButton(
      color: _theme.cardColor,
      child: Icon(Icons.person),
      onPressed: () {},
    ),
    'Colored': FlatButton(
      color: _theme.accentColor,
      child: Text('Colored Button'),
      onPressed: () {},
    ),
    'Splash': FlatButton(
      color: _theme.primaryColor,
      textColor: _theme.canvasColor,
      splashColor: _theme.accentColor,
      child: Text('Splash Color'),
      onPressed: () {},
    ),
  };

  FlatButtonPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DemoScaffold(
      title: 'Flat Buttons',
      widgets: WidgetDisplay.createWidgetDisplays(buttons),
    );
  }
}

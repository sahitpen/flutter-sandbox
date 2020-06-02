import 'package:flutter/material.dart';
import 'package:flutter_sandbox/common/constants/app_theme.dart';
import 'package:flutter_sandbox/views/demo_elements/demo_scaffold.dart';
import 'package:flutter_sandbox/views/widget_elements/widget_display.dart';

class IconButtonPage extends StatelessWidget {
  static final _theme = AppTheme.theme;
  final buttons = {
    'Basic': IconButton(
      icon: Icon(Icons.payment),
      onPressed: () {},
    ),
    'Hover Tooltip': IconButton(
      icon: Icon(Icons.payment),
      tooltip: 'Make payment',
      onPressed: () {},
    ),
    'Filled Background': Ink(
      decoration: ShapeDecoration(
        color: _theme.accentColor,
        shape: CircleBorder(),
      ),
      child: IconButton(
        color: _theme.canvasColor,
        icon: Icon(Icons.payment),
        onPressed: () {},
      ),
    ),
  };

  IconButtonPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DemoScaffold(
      title: 'Icon Buttons',
      widgets: WidgetDisplay.createWidgetDisplays(buttons),
    );
  }
}

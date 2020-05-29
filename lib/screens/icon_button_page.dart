import 'package:flutter/material.dart';
import 'package:flutter_sandbox/views/demo_scaffold.dart';
import 'package:flutter_sandbox/views/widget_display.dart';

class IconButtonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, Widget> buttons = {
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
          color: Theme.of(context).accentColor,
          shape: CircleBorder(),
        ),
        child: IconButton(
          color: Theme.of(context).canvasColor,
          icon: Icon(Icons.payment),
          onPressed: () {},
        ),
      ),
    };
    return DemoScaffold(
      title: 'Icon Buttons',
      widgets: createWidgetDisplays(buttons)
    );
  }
}

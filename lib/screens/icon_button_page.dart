import 'package:flutter/material.dart';
import 'package:flutter_sandbox/views/demo_scaffold.dart';
import 'package:flutter_sandbox/views/widget_display.dart';

class IconButtonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DemoScaffold(
      title: 'Icon Buttons',
      widgets: [
        WidgetDisplay(
          title: 'Basic',
          widget: IconButton(
            icon: Icon(Icons.payment),
            onPressed: () {},
          ),
        ),
        WidgetDisplay(
          title: 'Hover Tooltip',
          widget: IconButton(
            icon: Icon(Icons.payment),
            tooltip: 'Make payment',
            onPressed: () {},
          ),
        ),
        WidgetDisplay(
          title: 'Filled Background',
          widget: Ink(
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
        ),
      ],
    );
  }
}

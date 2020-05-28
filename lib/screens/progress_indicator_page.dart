import 'package:flutter/material.dart';
import 'package:flutter_sandbox/views/demo_scaffold.dart';
import 'package:flutter_sandbox/views/widget_display.dart';

class ProgressIndicatorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DemoScaffold(
      title: 'Progress Indicators',
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: ListView(
            children: <Widget>[
              WidgetDisplay(
                title: 'Circular',
                widget: CircularProgressIndicator(),
              ),
              WidgetDisplay(
                title: 'Linear',
                widget: LinearProgressIndicator(
                  backgroundColor: Theme.of(context).primaryColor,
                ),
              ),
              WidgetDisplay(
                title: 'Refresh',
                widget: RefreshProgressIndicator(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

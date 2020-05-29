import 'package:flutter/material.dart';
import 'package:flutter_sandbox/views/demo_scaffold.dart';
import 'package:flutter_sandbox/views/widget_display.dart';

class ProgressIndicatorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     final Map<String, Widget> indicators = {
      'Circular': CircularProgressIndicator(),
      'Linear': LinearProgressIndicator(
        backgroundColor: Theme.of(context).primaryColor,
      ),
      'Refresh': RefreshProgressIndicator(),
    };
    return DemoScaffold(
      title: 'Progress Indicators',
      widgets: createWidgetDisplays(indicators),
    );
  }
}

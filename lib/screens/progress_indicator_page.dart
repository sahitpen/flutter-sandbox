import 'package:flutter/material.dart';
import 'package:flutter_sandbox/common/constants/app_theme.dart';
import 'package:flutter_sandbox/views/demo_elements/demo_scaffold.dart';
import 'package:flutter_sandbox/views/widget_elements/widget_display.dart';

class ProgressIndicatorPage extends StatelessWidget {
  final indicators = {
    'Circular': CircularProgressIndicator(),
    'Linear': LinearProgressIndicator(
      backgroundColor: AppTheme.theme.primaryColor,
    ),
    'Refresh': RefreshProgressIndicator(),
  };

  ProgressIndicatorPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DemoScaffold(
      title: 'Progress Indicators',
      widgets: WidgetDisplay.createWidgetDisplays(indicators),
    );
  }
}

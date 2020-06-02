import 'package:flutter/material.dart';
import 'package:flutter_sandbox/views/demo_elements/demo_scaffold.dart';
import 'package:flutter_sandbox/views/widget_elements/custom_dismissible.dart';
import 'package:flutter_sandbox/views/widget_elements/widget_display.dart';

class DismissiblePage extends StatelessWidget {
  static const _dismissibles = {
    'Basic': CustomDismissible(
      title: 'Swipe to dismiss (basic)',
      id: 'dismissible_1',
    ),
    'Snackbar': CustomDismissible(
      title: 'Swipe to dismiss (show snackbar)',
      id: 'dismissible_2',
      isVisibleSnackBar: true,
    ),
    'Vertical Dismiss': CustomDismissible(
      title: 'Swipe vertically to dismiss',
      id: 'dismissible_3',
      swipeDirection: DismissDirection.vertical,
    ),
  };

  DismissiblePage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DemoScaffold(
      title: 'Dismissible',
      widgets: WidgetDisplay.createWidgetDisplays(
        _dismissibles,
        showTitles: false,
      ),
    );
  }
}

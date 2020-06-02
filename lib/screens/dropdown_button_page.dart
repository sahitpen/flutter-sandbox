import 'package:flutter/material.dart';
import 'package:flutter_sandbox/common/constants/app_theme.dart';
import 'package:flutter_sandbox/views/demo_elements/demo_scaffold.dart';
import 'package:flutter_sandbox/views/widget_elements/custom_dropdown_button.dart';
import 'package:flutter_sandbox/views/widget_elements/widget_display.dart';

class DropdownButtonPage extends StatelessWidget {
  final buttons = {
    'Basic': CustomDropdownButton(),
    'Underline': CustomDropdownButton(hasUnderline: true),
    'Custom Icon': CustomDropdownButton(hasArrowIcon: true),
    'Colored': CustomDropdownButton(
      dropdownColor: AppTheme.theme.accentColor,
    ),
  };

  DropdownButtonPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DemoScaffold(
      title: 'Dropdown Buttons',
      widgets: WidgetDisplay.createWidgetDisplays(buttons),
    );
  }
}

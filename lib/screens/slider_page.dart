import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sandbox/views/demo_elements/demo_scaffold.dart';
import 'package:flutter_sandbox/views/widget_elements/custom_cupertino_slider.dart';
import 'package:flutter_sandbox/views/widget_elements/custom_range_slider.dart';
import 'package:flutter_sandbox/views/widget_elements/custom_slider.dart';
import 'package:flutter_sandbox/views/widget_elements/widget_display.dart';

class SliderPage extends StatelessWidget {
  static const sliders = {
    'Basic': CustomSlider(),
    'Divisioned': CustomSlider(divisions: 4),
    'Labeled': CustomSlider(
      divisions: 4,
      hasLabel: true,
    ),
    'Range': CustomRangeSlider(),
    'Cupertino': CustomCupertinoSlider(),
  };

  SliderPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DemoScaffold(
      title: 'Sliders',
      widgets: WidgetDisplay.createWidgetDisplays(sliders),
    );
  }
}

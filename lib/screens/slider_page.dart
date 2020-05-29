import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sandbox/views/demo_scaffold.dart';
import 'package:flutter_sandbox/views/widget_display.dart';

class SliderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DemoScaffold(
      title: 'Sliders',
      widgets: [
        WidgetDisplay(
          title: 'Basic',
          widget: CustomSlider(),
        ),
        WidgetDisplay(
          title: 'Divisioned',
          widget: CustomSlider(divisions: 4),
        ),
        WidgetDisplay(
          title: 'Labeled',
          widget: CustomSlider(
            divisions: 4,
            hasLabel: true,
          ),
        ),
        WidgetDisplay(
          title: 'Range',
          widget: CustomRangeSlider(),
        ),
        WidgetDisplay(
          title: 'Cupertino',
          widget: CustomCupertinoSlider(),
        ),
      ],
    );
  }
}

class CustomSlider extends StatefulWidget {
  final int divisions;
  final bool hasLabel;
  CustomSlider({this.divisions, this.hasLabel = false});
  @override
  _SliderState createState() => _SliderState();
}

class _SliderState extends State<CustomSlider> {
  double slideValue = 0;
  @override
  Widget build(BuildContext context) {
    return Slider(
      value: slideValue,
      onChanged: (newValue) {
        setState(() => slideValue = newValue);
      },
      divisions: widget.divisions,
      label: widget.hasLabel ? '$slideValue' : null,
      min: 0,
      max: 100,
      inactiveColor: Theme.of(context).accentColor,
      activeColor: Theme.of(context).primaryColor,
    );
  }
}

class CustomCupertinoSlider extends StatefulWidget {
  @override
  _CustomCupertinoSliderState createState() => _CustomCupertinoSliderState();
}

class _CustomCupertinoSliderState extends State<CustomCupertinoSlider> {
  double slideValue = 0;
  @override
  Widget build(BuildContext context) {
    return CupertinoSlider(
      value: slideValue,
      onChanged: (newValue) {
        setState(() => slideValue = newValue);
      },
    );
  }
}

class CustomRangeSlider extends StatefulWidget {
  @override
  _CustomRangeSliderState createState() => _CustomRangeSliderState();
}

class _CustomRangeSliderState extends State<CustomRangeSlider> {
  var slideRange = RangeValues(20, 80);
  @override
  Widget build(BuildContext context) {
    return RangeSlider(
      values: slideRange,
      onChanged: (RangeValues newRange) {
        setState(() => slideRange = newRange);
      },
      min: 0,
      max: 100,
      inactiveColor: Theme.of(context).accentColor,
      activeColor: Theme.of(context).primaryColor,
    );
  }
}

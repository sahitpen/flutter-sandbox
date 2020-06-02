import 'package:flutter/material.dart';
import 'package:flutter_sandbox/common/constants/app_theme.dart';

class CustomSlider extends StatefulWidget {
  final int divisions;
  final bool hasLabel;

  const CustomSlider({
    Key key,
    this.divisions,
    this.hasLabel = false,
  }) : super(key: key);

  @override
  _SliderState createState() => _SliderState();
}

class _SliderState extends State<CustomSlider> {
  double _slideValue = 0;
  final _theme = AppTheme.theme;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _slideValue,
      onChanged: (newValue) => _handleSliderChange(newValue),
      divisions: widget.divisions,
      label: widget.hasLabel ? '$_slideValue' : null,
      min: 0,
      max: 100,
      inactiveColor: _theme.accentColor,
      activeColor: _theme.primaryColor,
    );
  }

  void _handleSliderChange(double newValue) {
    setState(() => _slideValue = newValue);
  }
}

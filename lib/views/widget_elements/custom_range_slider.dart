import 'package:flutter/material.dart';
import 'package:flutter_sandbox/common/constants/app_theme.dart';

class CustomRangeSlider extends StatefulWidget {
  const CustomRangeSlider({
    Key key,
  }) : super(key: key);

  @override
  _CustomRangeSliderState createState() => _CustomRangeSliderState();
}

class _CustomRangeSliderState extends State<CustomRangeSlider> {
  final _theme = AppTheme.theme;
  RangeValues _slideRange = RangeValues(20, 80);

  @override
  Widget build(BuildContext context) {
    return RangeSlider(
      values: _slideRange,
      onChanged: (newRange) => _handleSliderChange(newRange),
      min: 0,
      max: 100,
      inactiveColor: _theme.accentColor,
      activeColor: _theme.primaryColor,
    );
  }

  void _handleSliderChange(RangeValues newRange) {
    setState(() => _slideRange = newRange);
  }
}

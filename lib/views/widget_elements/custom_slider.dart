import 'package:flutter/material.dart';
import 'package:flutter_sandbox/common/constants/app_theme.dart';

class CustomSlider extends StatelessWidget {
  static final _theme = AppTheme.theme;
  final int divisions;
  final bool hasLabel;

  const CustomSlider({
    Key key,
    this.divisions,
    this.hasLabel = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _slideValue = 0.0;
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return Slider(
          value: _slideValue,
          onChanged: (newValue) => setState(() => _slideValue = newValue),
          divisions: divisions,
          label: hasLabel ? '$_slideValue' : null,
          min: 0,
          max: 100,
          inactiveColor: _theme.accentColor,
          activeColor: _theme.primaryColor,
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_sandbox/common/constants/app_theme.dart';

class CustomRangeSlider extends StatelessWidget {
  static final _theme = AppTheme.theme;

  const CustomRangeSlider({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _slideRange = RangeValues(20, 80);
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return RangeSlider(
          values: _slideRange,
          onChanged: (newRange) => setState(() => _slideRange = newRange),
          min: 0,
          max: 100,
          inactiveColor: _theme.accentColor,
          activeColor: _theme.primaryColor,
        );
      },
    );
  }
}

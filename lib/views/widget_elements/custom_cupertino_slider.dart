import 'package:flutter/cupertino.dart';

class CustomCupertinoSlider extends StatefulWidget {
  const CustomCupertinoSlider({
    Key key,
  }) : super(key: key);

  @override
  _CustomCupertinoSliderState createState() => _CustomCupertinoSliderState();
}

class _CustomCupertinoSliderState extends State<CustomCupertinoSlider> {
  double _slideValue = 0;
  @override
  Widget build(BuildContext context) {
    return CupertinoSlider(
      value: _slideValue,
      onChanged: (newValue) => _handleSliderChange(newValue),
    );
  }

  void _handleSliderChange(double newValue) {
    setState(() => _slideValue = newValue);
  }
}

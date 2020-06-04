import 'package:flutter/cupertino.dart';

class CustomCupertinoSlider extends StatelessWidget {
  const CustomCupertinoSlider({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _slideValue = 0.0;
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return CupertinoSlider(
          value: _slideValue,
          onChanged: (newValue) => setState(() => _slideValue = newValue),
        );
      },
    );
  }
}

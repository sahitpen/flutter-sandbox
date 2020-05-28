import 'package:flutter/material.dart';
import 'package:flutter_sandbox/common/constants/app_text.dart';

class WidgetDisplay extends StatelessWidget {
  final Widget widget;
  final String title;
  WidgetDisplay({this.title, this.widget});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: <Widget>[
          Text(
            title,
            style: AppText.header,
          ),
          SizedBox(height: 20),
          widget,
        ],
      ),
    );
  }
}
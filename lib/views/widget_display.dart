import 'package:flutter/material.dart';
import 'package:flutter_sandbox/common/constants/app_text.dart';

class WidgetDisplay extends StatelessWidget {
  final Widget widget;
  final String title;
  final bool showTitles;
  WidgetDisplay({this.title, this.widget, this.showTitles});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: <Widget>[
          Visibility(
            visible: showTitles ?? true,
            child: Column(
              children: <Widget>[
                Text(
                  title,
                  style: AppText.header,
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
          widget,
        ],
      ),
    );
  }
}

List<WidgetDisplay> createWidgetDisplays(Map<String, Widget> widgetMap,
    {bool showTitles}) {
  return widgetMap.keys.map((String widgetTitle) {
    return WidgetDisplay(
      title: widgetTitle,
      widget: widgetMap[widgetTitle],
      showTitles: showTitles,
    );
  }).toList();
}

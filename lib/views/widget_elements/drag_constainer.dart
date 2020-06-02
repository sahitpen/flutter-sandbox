import 'package:flutter/material.dart';
import 'package:flutter_sandbox/common/constants/app_text.dart';
import 'package:flutter_sandbox/common/constants/app_theme.dart';

class DragContainer extends StatelessWidget {
  final Color color;
  final String text;

  const DragContainer({
    Key key,
    this.color,
    this.text = AppText.emptyString,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = AppTheme.theme;
    return Container(
      color: color ?? _theme.highlightColor,
      height: 100,
      width: 300,
      child: Center(
        child: Text(
          text,
          style: AppText.subtitleLight,
          key: ValueKey(text),
        ),
      ),
    );
  }

  static Draggable makeDraggable({
    Widget child,
    Widget feedback,
    Widget childWhenDragging,
    bool isLongPress = false,
    String data = AppText.emptyString,
  }) {
    if (isLongPress) {
      return LongPressDraggable(
        child: child,
        feedback: feedback ?? child,
        childWhenDragging: childWhenDragging ?? Container(),
        data: data,
      );
    } else {
      return Draggable(
        child: child,
        feedback: feedback ?? child,
        childWhenDragging: childWhenDragging ?? Container(),
        data: data,
      );
    }
  }
}

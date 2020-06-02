import 'package:flutter/material.dart';
import 'package:flutter_sandbox/common/constants/app_text.dart';
import 'package:flutter_sandbox/common/constants/app_theme.dart';
import 'package:flutter_sandbox/views/demo_elements/demo_scaffold.dart';
import 'package:flutter_sandbox/views/widget_elements/drag_constainer.dart';
import 'package:flutter_sandbox/views/widget_elements/widget_display.dart';

class DraggablePage extends StatefulWidget {
  DraggablePage({
    Key key,
  }) : super(key: key);

  @override
  _DraggablePageState createState() => _DraggablePageState();
}

class _DraggablePageState extends State<DraggablePage> {
  bool _isDragSuccessful = false;
  final _theme = AppTheme.theme;

  @override
  Widget build(BuildContext context) {
    final draggables = _initDraggables();
    return DemoScaffold(
      title: 'Draggable',
      widgets: WidgetDisplay.createWidgetDisplays(
        draggables,
        showTitles: false,
      ),
    );
  }

  // TODO: extract widgets into separate classes
  Map<String, Widget> _initDraggables() {
    return {
      'Basic': DragContainer.makeDraggable(
        child: DragContainer(text: 'Basic'),
      ),
      'Divisioned': DragContainer.makeDraggable(
        child: DragContainer(text: 'Long Press Drag'),
        isLongPress: true,
      ),
      'Labeled': DragContainer.makeDraggable(
        child: DragContainer(text: 'Stationary Dragging Child'),
        childWhenDragging: DragContainer(
          color: _theme.primaryColorDark,
          text: 'Stationary child!',
        ),
      ),
      'Range': DragContainer.makeDraggable(
        child: DragContainer(text: 'Custom Drag Feedback'),
        feedback: DragContainer(
          color: _theme.highlightColor,
          text: 'Dragging!',
        ),
      ),
      'Cupertino': Visibility(
        visible: !_isDragSuccessful,
        child: DragContainer.makeDraggable(
            child: DragContainer(text: 'Droppable Drag Card'),
            data: 'droppable'),
      ),
      'Drag Target': DragTarget(
        builder: (context, candidateData, rejectedData) {
          return Container(
            height: 150,
            color: _theme.cardColor,
            child: Center(
              child: Text(
                'Drag card here!',
                style: AppText.subtitle,
              ),
            ),
          );
        },
        onAccept: (data) => _handleDragSuccess(data),
      ),
    };
  }

  void _handleDragSuccess(String data) {
    if (data == 'droppable') {
      setState(() => _isDragSuccessful = true);
    }
  }
}

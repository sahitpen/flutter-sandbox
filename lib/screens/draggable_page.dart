import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sandbox/bloc/draggable_bloc.dart';
import 'package:flutter_sandbox/common/constants/app_text.dart';
import 'package:flutter_sandbox/common/constants/app_theme.dart';
import 'package:flutter_sandbox/views/demo_elements/demo_scaffold.dart';
import 'package:flutter_sandbox/views/widget_elements/drag_constainer.dart';
import 'package:flutter_sandbox/views/widget_elements/widget_display.dart';

class DraggablePage extends StatelessWidget {
  final _theme = AppTheme.theme;

  DraggablePage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final draggables = _initDraggables(context);
    return DemoScaffold(
      title: 'Draggable',
      widgets: WidgetDisplay.createWidgetDisplays(
        draggables,
        showTitles: false,
      ),
    );
  }

  // TODO: extract widgets into separate classes
  Map<String, Widget> _initDraggables(BuildContext context) {
    final draggableBloc = BlocProvider.of<DraggableBloc>(context);
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
      'Cupertino': BlocBuilder<DraggableBloc, bool>(
        builder: (context, isVisible) {
          return Visibility(
            visible: isVisible,
            child: DragContainer.makeDraggable(
              child: DragContainer(text: 'Droppable Drag Card'),
              data: 'droppable',
            ),
          );
        },
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
        onAccept: (data) => _handleDrag(
          data: data,
          bloc: draggableBloc,
          isDragComplete: true,
        ),
        onLeave: (data) => _handleDrag(
          data: data,
          bloc: draggableBloc,
          isDragComplete: false,
        ),
      ),
    };
  }

  void _handleDrag({
    @required String data,
    @required DraggableBloc bloc,
    @required bool isDragComplete,
  }) {
    assert(data != null);
    assert(bloc != null);
    assert(isDragComplete != null);

    if (data == 'droppable') {
      if (isDragComplete) {
        bloc.add(DraggableEvent.DragComplete);
      } else {
        bloc.add(DraggableEvent.DragIncomplete);
      }
    }
  }
}

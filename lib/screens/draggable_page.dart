import 'package:flutter/material.dart';
import 'package:flutter_sandbox/common/constants/app_text.dart';
import 'package:flutter_sandbox/views/demo_scaffold.dart';

class DraggablePage extends StatefulWidget {
  @override
  _DraggablePageState createState() => _DraggablePageState();
}

class _DraggablePageState extends State<DraggablePage> {
  bool isDragSuccessful = false;
  @override
  Widget build(BuildContext context) {
    return DemoScaffold(
      title: 'Draggable',
      body: ListView(
        padding: EdgeInsets.only(top: 16.0),
        children: <Widget>[
          _makeDraggable(
            child: DragContainer(text: 'Basic'),
          ),
          SizedBox(height: 10),
          _makeDraggable(
            child: DragContainer(text: 'Long Press Drag'),
            isLongPress: true,
          ),
          SizedBox(height: 10),
          _makeDraggable(
            child: DragContainer(text: 'Stationary Dragging Child'),
            childWhenDragging: DragContainer(
              color: Theme.of(context).primaryColorDark,
              text: 'Stationary child!',
            ),
          ),
          SizedBox(height: 10),
          _makeDraggable(
            child: DragContainer(text: 'Custom Drag Feedback'),
            feedback: DragContainer(
              color: Theme.of(context).highlightColor,
              text: 'Dragging!',
            ),
          ),
          SizedBox(height: 10),
          Visibility(
            visible: !isDragSuccessful,
            child: _makeDraggable(
                child: DragContainer(text: 'Droppable Drag Card')),
          ),
          DragTarget(
            builder: (context, candidateData, rejectedData) {
              return Container(
                height: 150,
                color: Theme.of(context).cardColor,
                child: Center(
                  child: Text(
                    'Drag card here!',
                    style: AppText.subtitle,
                  ),
                ),
              );
            },
            onAccept: (data) {
              setState(() {
                isDragSuccessful = true;
              });
            },
          ),
        ],
      ),
    );
  }

  Draggable _makeDraggable(
      {@required Widget child,
      Widget feedback,
      Widget childWhenDragging,
      bool isLongPress = false}) {
    if (isLongPress) {
      return LongPressDraggable(
        child: child,
        feedback: feedback ?? child,
        childWhenDragging: childWhenDragging ?? Container(),
      );
    } else {
      return Draggable(
        child: child,
        feedback: feedback ?? child,
        childWhenDragging: childWhenDragging ?? Container(),
      );
    }
  }
}

class DragContainer extends StatelessWidget {
  final Color color;
  final String text;
  DragContainer({this.color, this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color ?? Theme.of(context).highlightColor,
      height: 100,
      width: 300,
      child: Center(
        child: Text(
          text ?? '',
          style: AppText.subtitleLight,
          key: ValueKey(text),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_sandbox/views/demo_scaffold.dart';

class DismissiblePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DemoScaffold(
      title: 'Dismissible',
      widgets: [
        CustomDismissible(
          title: 'Swipe to dismiss (basic)',
          id: 'dismissible_1',
        ),
        CustomDismissible(
          title: 'Swipe to dismiss (show snackbar)',
          id: 'dismissible_2',
          isVisibleSnackBar: true,
        ),
        CustomDismissible(
          title: 'Swipe vertically to dismiss',
          id: 'dismissible_3',
          swipeDirection: DismissDirection.vertical,
        ),
      ],
    );
  }
}

class CustomDismissible extends StatelessWidget {
  final String title;
  final String id;
  final DismissDirection swipeDirection;
  final isVisibleSnackBar;

  CustomDismissible({
    @required this.title,
    @required this.id,
    this.swipeDirection,
    this.isVisibleSnackBar,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      child: ListTile(
        title: Text(
          title,
          key: ValueKey(id + "_text"),
        ),
        trailing: Icon(Icons.touch_app),
      ),
      background: Container(color: Theme.of(context).highlightColor),
      key: ValueKey(id),
      direction: swipeDirection ?? DismissDirection.horizontal,
      onDismissed: (DismissDirection direction) {
        if (isVisibleSnackBar)
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text('Tile was dismissed!'),
          ));
      },
    );
  }
}

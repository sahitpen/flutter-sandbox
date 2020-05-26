import 'package:flutter/material.dart';
import 'package:flutter_sandbox/common/styles.dart';

class DismissiblePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          'Dismissable',
          style: Styles.navBarText,
        ),
      ),
      body: Column(children: <Widget>[
        CustomDismissible(
          title: 'Swipe to dismiss (basic)',
          id: 'dismissible_1',
          swipeDirection: DismissDirection.horizontal,
          isVisibleSnackBar: false,
        ),
        CustomDismissible(
          title: 'Swipe to dismiss (show snackbar)',
          id: 'dismissible_2',
          swipeDirection: DismissDirection.horizontal,
          isVisibleSnackBar: true,
        ),
        CustomDismissible(
          title: 'Swipe vertically to dismiss',
          id: 'dismissible_3',
          swipeDirection: DismissDirection.vertical,
          isVisibleSnackBar: false,
        ),
      ]),
    );
  }
}

class CustomDismissible extends StatelessWidget {
  final String title;
  final String id;
  final bool isVisibleSnackBar;
  final DismissDirection swipeDirection;

  CustomDismissible({
    @required this.title,
    @required this.id,
    @required this.swipeDirection,
    @required this.isVisibleSnackBar,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      child: ListTile(
        title: Text(title),
        trailing: Icon(Icons.touch_app),
      ),
      background: Container(color: Colors.blueGrey),
      key: ValueKey(id),
      direction: swipeDirection,
      onDismissed: (DismissDirection direction) {
        if (isVisibleSnackBar)
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text('Tile was dismissed!'),
          ));
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_sandbox/common/constants/app_theme.dart';

class CustomDismissible extends StatelessWidget {
  final String title;
  final String id;
  final DismissDirection swipeDirection;
  final bool isVisibleSnackBar;

  const CustomDismissible({
    Key key,
    @required this.title,
    @required this.id,
    this.swipeDirection = DismissDirection.horizontal,
    this.isVisibleSnackBar = false,
  })  : assert(
          title != null,
          id != null,
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = AppTheme.theme;
    return Dismissible(
      child: ListTile(
        title: Text(
          title,
          key: ValueKey(id + '_text'),
        ),
        trailing: const Icon(Icons.touch_app),
      ),
      background: Container(color: _theme.highlightColor),
      key: ValueKey(id),
      direction: swipeDirection,
      onDismissed: (DismissDirection direction) {
        if (isVisibleSnackBar) {
          Scaffold.of(context).showSnackBar(
            const SnackBar(
              content: Text('Tile was dismissed!'),
            ),
          );
        }
      },
    );
  }
}

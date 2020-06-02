import 'package:flutter/material.dart';
import 'package:flutter_sandbox/common/constants/app_theme.dart';

class PlaygroundNavBar extends StatelessWidget {
  const PlaygroundNavBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = AppTheme.theme;
    return BottomNavigationBar(
      backgroundColor: _theme.cardColor,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Home'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          title: Text('Profile'),
        )
      ],
      selectedItemColor: _theme.accentColor,
    );
  }
}

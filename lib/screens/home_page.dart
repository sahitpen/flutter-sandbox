import 'package:flutter/material.dart';
import 'package:flutter_sandbox/common/constants/app_theme.dart';
import 'package:flutter_sandbox/views/appbar.dart';
import 'package:flutter_sandbox/views/demo_elements/demo_list_container.dart';
import 'package:flutter_sandbox/views/navbar.dart';

// add a newline to the end of every file
// add trailing commas to everything to format properly
// const
class HomePage extends StatefulWidget {
  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final _theme = AppTheme.theme;
    return Scaffold(
      backgroundColor: _theme.primaryColor,
      appBar: PlaygroundAppBar(),
      body: DemoListContainer(),
      bottomNavigationBar: PlaygroundNavBar(),
    );
  }
}

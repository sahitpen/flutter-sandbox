import 'package:flutter/material.dart';
import 'package:flutter_sandbox/common/constants/app_theme.dart';
import 'package:flutter_sandbox/views/appbar.dart';
import 'package:flutter_sandbox/views/demo_elements/demo_list_container.dart';
import 'package:flutter_sandbox/views/navbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.theme.primaryColor,
      appBar: PlaygroundAppBar(),
      body: DemoListContainer(),
      bottomNavigationBar: PlaygroundNavBar(),
    );
  }
}

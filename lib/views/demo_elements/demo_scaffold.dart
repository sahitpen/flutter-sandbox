import 'package:flutter/material.dart';
import 'package:flutter_sandbox/common/constants/app_padding.dart';
import 'package:flutter_sandbox/common/constants/app_text.dart';
import 'package:flutter_sandbox/common/constants/app_theme.dart';

class DemoScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final List<Widget> widgets;
  final FloatingActionButton floatingActionButton;

  const DemoScaffold({
    Key key,
    this.title,
    this.body,
    this.widgets,
    this.floatingActionButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.theme.canvasColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppTheme.theme.canvasColor,
        iconTheme: IconThemeData(
          color: AppTheme.theme.primaryColorDark,
        ),
        title: Text(
          title,
          style: AppText.appBar,
        ),
      ),
      body: body ??
          ListView(
            padding: AppPadding.padding16,
            children: widgets,
          ),
      floatingActionButton: floatingActionButton,
    );
  }
}

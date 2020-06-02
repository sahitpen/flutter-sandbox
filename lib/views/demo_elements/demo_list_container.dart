import 'package:flutter/material.dart';
import 'package:flutter_sandbox/common/constants/app_borders.dart';
import 'package:flutter_sandbox/common/constants/app_theme.dart';
import 'package:flutter_sandbox/models/demo.dart';
import 'package:flutter_sandbox/models/demo_list.dart';
import 'package:flutter_sandbox/views/demo_elements/demo_section.dart';

class DemoListContainer extends StatelessWidget {
  final _demoPages = DemoList.demoPages;

  DemoListContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = AppTheme.theme;
    return ClipRRect(
      borderRadius: AppBorders.roundedTop,
      child: Container(
        color: _theme.canvasColor,
        child: ListView(
          key: ValueKey('widget_category_list'),
          children: _createDemoPages(_demoPages),
        ),
      ),
    );
  }

  List<Widget> _createDemoPages(Map<String, List<Demo>> demoPages) {
    List<Widget> _demoSections = [];
    demoPages.forEach((_demoCategory, _categoryPages) {
      final _section = DemoSection(
        category: _demoCategory,
        demoList: _categoryPages,
      );
      _demoSections.add(_section);
    });
    return _demoSections;
  }
}

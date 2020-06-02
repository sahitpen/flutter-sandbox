import 'package:flutter/material.dart';
import 'package:flutter_sandbox/common/constants/app_padding.dart';
import 'package:flutter_sandbox/common/constants/app_text.dart';
import 'package:flutter_sandbox/models/demo.dart';

import 'demo_card.dart';

class DemoSection extends StatelessWidget {
  final String category;
  final List<Demo> demoList;

  const DemoSection({
    Key key,
    this.category,
    this.demoList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: AppPadding.padding16,
          child: Text(
            category,
            style: AppText.header,
          ),
        ),
        Container(
          height: 130,
          child: ListView.builder(
            key: ValueKey(category + '_demos_list'),
            scrollDirection: Axis.horizontal,
            itemCount: demoList.length,
            itemBuilder: (context, index) {
              final _demo = demoList[index];
              return Container(
                padding: AppPadding.padding16Left,
                width: 200,
                child: DemoCard(demo: _demo),
              );
            },
          ),
        ),
      ],
    );
  }
}

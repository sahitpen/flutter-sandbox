import 'package:flutter/material.dart';
import 'package:flutter_sandbox/common/constants/app_borders.dart';
import 'package:flutter_sandbox/common/constants/app_text.dart';
import 'package:flutter_sandbox/models/demo.dart';

class DemoCard extends StatelessWidget {
  final Demo demo;

  const DemoCard({
    Key key,
    this.demo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (demo.pageRoute != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => demo.pageRoute),
          );
        }
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: AppBorders.rounded,
        ),
        child: Center(
          child: Text(
            demo.name,
            style: AppText.subtitle,
          ),
        ),
        elevation: 3.0,
      ),
    );
  }
}

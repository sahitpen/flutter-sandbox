import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sandbox/common/constants/app_padding.dart';
import 'package:flutter_sandbox/common/constants/app_text.dart';
import 'package:flutter_sandbox/common/constants/app_theme.dart';

class PlaygroundAppBar extends PreferredSize {
  const PlaygroundAppBar({
    Key key,
  }) : super(
          key: key,
          child: null,
          preferredSize: const Size.fromHeight(125),
        );

  @override
  Widget build(BuildContext context) {
    final _theme = AppTheme.theme;
    return Container(
      height: preferredSize.height,
      child: AppBar(
        title: Column(
          children: <Widget>[
            Text(
              'Hey Sahit.',
              style: AppText.appBarLight,
            ),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(30),
          child: Padding(
            padding: AppPadding.padding25Bottom,
            child: TyperAnimatedTextKit(
              isRepeatingAnimation: true,
              pause: const Duration(seconds: 4),
              speed: const Duration(milliseconds: 60),
              text: [
                'Welcome to the playground.',
                'Experiment with any widget.',
              ],
              textStyle: AppText.headerAccent,
              textAlign: TextAlign.start,
              alignment: AlignmentDirectional.topStart,
            ),
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: AppPadding.padding16Right,
            child: Icon(
              Icons.settings,
              color: _theme.cardColor,
            ),
          ),
        ],
      ),
    );
  }
}

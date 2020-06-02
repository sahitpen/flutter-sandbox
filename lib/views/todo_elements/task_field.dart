import 'package:flutter/material.dart';
import 'package:flutter_sandbox/common/constants/app_borders.dart';
import 'package:flutter_sandbox/common/constants/app_padding.dart';

class TaskField extends StatelessWidget {
  final TextEditingController controller;

  const TaskField({
    ValueKey key,
    @required this.controller,
  })  : assert(controller != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      key: ValueKey((key as ValueKey).value + '_text'),
      decoration: InputDecoration(
        hintText: 'Enter your task here.',
        contentPadding: AppPadding.padding16,
        border: OutlineInputBorder(borderRadius: AppBorders.rounded),
      ),
      controller: controller,
    );
  }
}

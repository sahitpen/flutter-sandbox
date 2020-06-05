import 'package:flutter/material.dart';
import 'package:flutter_sandbox/common/constants/app_borders.dart';
import 'package:flutter_sandbox/common/constants/app_padding.dart';

class RoundedTextField extends StatelessWidget {
  final TextEditingController controller;
  final Function onSubmitted;
  final String hintText;
  final Icon prefixIcon;

  const RoundedTextField({
    ValueKey key,
    @required this.controller,
    this.onSubmitted,
    this.hintText = '',
    this.prefixIcon,
  })  : assert(controller != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      key: ValueKey((key as ValueKey).value + '_text'),
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: AppPadding.padding16,
        border: OutlineInputBorder(borderRadius: AppBorders.rounded),
        prefixIcon: prefixIcon,
      ),
      controller: controller,
      onSubmitted: onSubmitted,
    );
  }
}

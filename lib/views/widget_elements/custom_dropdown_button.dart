import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sandbox/bloc/dropdown_bloc.dart';
import 'package:flutter_sandbox/common/constants/app_theme.dart';
import 'package:flutter_sandbox/common/sample_data.dart';

class CustomDropdownButton extends StatelessWidget {
  final bool hasUnderline;
  final bool hasArrowIcon;
  final Color dropdownColor;

  const CustomDropdownButton({
    Key key,
    this.hasUnderline = false,
    this.hasArrowIcon = false,
    this.dropdownColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = AppTheme.theme;
    final dropdownBloc = BlocProvider.of<DropdownBloc>(context);
    return BlocBuilder<DropdownBloc, String>(
      builder: (context, selectedItem) {
        return DropdownButton<String>(
          isExpanded: true,
          value: selectedItem,
          items: _createDropdownItems(),
          onChanged: (newItem) => dropdownBloc.add(SelectItem(newItem)),
          underline: hasUnderline
              ? Container(
                  height: 2,
                  color: _theme.accentColor,
                )
              : null,
          icon: hasArrowIcon
              ? const Icon(Icons.arrow_downward)
              : const Icon(Icons.arrow_drop_down),
          dropdownColor: dropdownColor,
        );
      },
    );
  }

  List<DropdownMenuItem<String>> _createDropdownItems() {
    return SampleData.dropdownItems.map((String item) {
      return DropdownMenuItem(
        value: item,
        child: Text(item),
      );
    }).toList();
  }
}

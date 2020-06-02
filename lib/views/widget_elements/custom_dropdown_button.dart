import 'package:flutter/material.dart';
import 'package:flutter_sandbox/common/constants/app_theme.dart';
import 'package:flutter_sandbox/common/sample_data.dart';

class CustomDropdownButton extends StatefulWidget {
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
  _CustomDropdownButtonState createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  String _selectedItem = 'One';
  final _theme = AppTheme.theme;
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      isExpanded: true,
      value: _selectedItem,
      items: _createDropdownItems(),
      onChanged: (newValue) => _handleDropdownChange(newValue),
      underline: widget.hasUnderline
          ? Container(
              height: 2,
              color: _theme.accentColor,
            )
          : null,
      icon: widget.hasArrowIcon
          ? const Icon(Icons.arrow_downward)
          : const Icon(Icons.arrow_drop_down),
      dropdownColor: widget.dropdownColor,
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

  void _handleDropdownChange(String newValue) {
    setState(() {
      _selectedItem = newValue;
    });
  }
}

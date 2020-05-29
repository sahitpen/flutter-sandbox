import 'package:flutter/material.dart';
import 'package:flutter_sandbox/views/demo_scaffold.dart';
import 'package:flutter_sandbox/views/widget_display.dart';

class DropdownButtonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DemoScaffold(
      title: 'Dropdown Buttons',
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          WidgetDisplay(
            title: 'Basic',
            widget: CustomDropdownButton(),
          ),
          WidgetDisplay(
            title: 'Underline',
            widget: CustomDropdownButton(hasUnderline: true),
          ),
          WidgetDisplay(
            title: 'Custom Icon',
            widget: CustomDropdownButton(hasArrowIcon: true),
          ),
        ],
      ),
    );
  }
}

class CustomDropdownButton extends StatefulWidget {
  final dropdownItems = ['One', 'Two', 'Three', 'Four'];
  final hasUnderline;
  final hasArrowIcon;
  CustomDropdownButton({this.hasUnderline = false, this.hasArrowIcon = false});
  @override
  _CustomDropdownButtonState createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  String selectedItem = 'One';
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      isExpanded: true,
      value: selectedItem,
      items: widget.dropdownItems.map((String item) {
        return DropdownMenuItem(
          value: item,
          child: Text(item),
        );
      }).toList(),
      onChanged: (String newValue) {
        setState(() {
          selectedItem = newValue;
        });
      },
      underline: widget.hasUnderline
          ? Container(
              height: 2,
              color: Theme.of(context).accentColor,
            )
          : null,
      icon: widget.hasArrowIcon
          ? Icon(Icons.arrow_downward)
          : Icon(Icons.arrow_drop_down),
    );
  }
}

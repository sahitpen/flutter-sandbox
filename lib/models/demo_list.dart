import 'package:flutter_sandbox/screens/dismissible_page.dart';
import 'package:flutter_sandbox/screens/draggable_page.dart';
import 'package:flutter_sandbox/screens/progress_indicator_page.dart';
import 'package:flutter_sandbox/screens/slider_page.dart';

import 'demo.dart';

class DemoList{
  static final touchInteractionDemos = [
    Demo(name: 'Dismissible', pageRoute: DismissiblePage()),
    Demo(name: 'Draggable', pageRoute: DraggablePage()),
    Demo(name: 'Scrollable', pageRoute: null),
  ];
  static final inputDemos = [
    Demo(name: 'Slider', pageRoute: SliderPage()),
    Demo(name: 'Form', pageRoute: null),
    Demo(name: 'Form Field', pageRoute: null),
    Demo(name: 'Text Field', pageRoute: null),
  ];
  static final informationDisplayDemos = [
    Demo(name: 'Progress Indicators', pageRoute: ProgressIndicatorPage()),
    Demo(name: 'Card', pageRoute: null),
    Demo(name: 'Chip', pageRoute: null),
    Demo(name: 'DataTable', pageRoute: null),
  ];
  static final buttonDemos = [
    Demo(name: 'ButtonBar', pageRoute: null),
    Demo(name: 'DropdownButton', pageRoute: null),
    Demo(name: 'FlatButton', pageRoute: null),
    Demo(name: 'IconButton', pageRoute: null),
    Demo(name: 'FloatingActionButton', pageRoute: null),
    Demo(name: 'OutlineButton', pageRoute: null),
  ];
  static final panelDemos = [
    Demo(name: 'AlertDialog', pageRoute: null),
    Demo(name: 'BottomSheet', pageRoute: null),
    Demo(name: 'ExpansionPanel', pageRoute: null),
    Demo(name: 'SimpleDialog', pageRoute: null),
    Demo(name: 'SnackBar', pageRoute: null),
  ];
}
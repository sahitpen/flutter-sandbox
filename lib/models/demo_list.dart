import 'package:flutter_sandbox/screens/dismissible_page.dart';

import 'demo.dart';

class DemoList{
  static final touchInteractionDemos = [
    Demo(name: 'Dismissible', pageRoute: DismissiblePage()),
    Demo(name: 'Draggable', pageRoute: null),
    Demo(name: 'Scrollable', pageRoute: null),
    Demo(name: 'Long Press Draggable', pageRoute: null)
  ];
  static final inputDemos = [
    Demo(name: 'Form', pageRoute: null),
    Demo(name: 'Form Field', pageRoute: null),
    Demo(name: 'Text Field', pageRoute: null),
  ];
}
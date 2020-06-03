import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sandbox/bloc/draggable_bloc.dart';
import 'package:flutter_sandbox/bloc/dropdown_bloc.dart';
import 'package:flutter_sandbox/bloc/todo_bloc.dart';
import 'package:flutter_sandbox/screens/dismissible_page.dart';
import 'package:flutter_sandbox/screens/draggable_page.dart';
import 'package:flutter_sandbox/screens/dropdown_button_page.dart';
import 'package:flutter_sandbox/screens/flat_button_page.dart';
import 'package:flutter_sandbox/screens/http_client_page.dart';
import 'package:flutter_sandbox/screens/icon_button_page.dart';
import 'package:flutter_sandbox/screens/progress_indicator_page.dart';
import 'package:flutter_sandbox/screens/slider_page.dart';
import 'package:flutter_sandbox/screens/todo_list_page.dart';

import 'demo.dart';
import 'demo_names.dart';

class DemoList {
  static final demoPages =
      DemoNames.allDemos.map<String, List<Demo>>((category, demos) {
    final demoPages = demos
        .map((demo) => Demo(name: demo, pageRoute: pageRoutes[demo]))
        .toList();
    return MapEntry(category, demoPages);
  });

  static final pageRoutes = {
    'Dismissible': DismissiblePage(),
    'Draggable': BlocProvider(
      create: (context) => DraggableBloc(),
      child: DraggablePage(),
    ),
    'Scrollable': null,
    'Slider': SliderPage(),
    'Form': null,
    'Form Field': null,
    'Text Field': null,
    'Progress Indicators': ProgressIndicatorPage(),
    'Card': null,
    'Chip': null,
    'DataTable': null,
    'DropdownButton': BlocProvider(
      create: (context) => DropdownBloc(),
      child: DropdownButtonPage(),
    ),
    'FlatButton': FlatButtonPage(),
    'IconButton': IconButtonPage(),
    'FloatingActionButton': null,
    'OutlineButton': null,
    'AlertDialog': null,
    'BottomSheet': null,
    'ExpansionPanel': null,
    'SimpleDialog': null,
    'SnackBar': null,
    'BLoC Todo List': BlocProvider(
      create: (context) => TodoBloc(),
      child: TodoListPage(),
    ),
    'Dio Http Client': HttpClientPage(),
  };
}

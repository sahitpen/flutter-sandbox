import 'package:flutter/material.dart';
import 'package:flutter_sandbox/bloc/todo_bloc.dart';
import 'package:flutter_sandbox/common/constants/app_theme.dart';

class AddTaskButton extends FloatingActionButton {
  final TodoBloc todoBloc;
  final TextEditingController controller;

  AddTaskButton({
    Key key,
    @required this.todoBloc,
    @required this.controller,
  })  : assert(
          todoBloc != null,
          controller != null,
        ),
        super(
          key: key,
          onPressed: () => todoBloc.add(
            AddTodoItem(controller.text),
          ),
          child: Icon(
            Icons.add,
            color: AppTheme.theme.canvasColor,
          ),
        );
}

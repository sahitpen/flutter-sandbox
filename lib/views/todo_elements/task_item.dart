import 'package:flutter/material.dart';
import 'package:flutter_sandbox/bloc/todo_bloc.dart';
import 'package:flutter_sandbox/common/constants/app_theme.dart';

class TaskItem extends StatelessWidget {
  final TodoBloc todoBloc;
  final String task;
  final Function onCompleted;

  const TaskItem({
    Key key,
    @required this.todoBloc,
    @required this.task,
    this.onCompleted,
  })  : assert(
          todoBloc != null,
          task != null,
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      background: ListTile(
        trailing: Icon(
          Icons.close,
          color: AppTheme.theme.primaryColor,
        ),
      ),
      key: UniqueKey(),
      onDismissed: onCompleted,
      child: ListTile(title: Text(task)),
    );
  }
}

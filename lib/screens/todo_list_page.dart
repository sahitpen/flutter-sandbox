import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sandbox/bloc/todo_bloc.dart';
import 'package:flutter_sandbox/views/demo_elements/demo_scaffold.dart';
import 'package:flutter_sandbox/views/todo_elements/add_task_button.dart';
import 'package:flutter_sandbox/views/todo_elements/task_field.dart';
import 'package:flutter_sandbox/views/todo_elements/task_item.dart';

class TodoListPage extends StatelessWidget {
  TodoListPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final todoBloc = BlocProvider.of<TodoBloc>(context);
    final controller = TextEditingController();
    return DemoScaffold(
      title: 'Todo List',
      widgets: [
        TaskField(
          key: ValueKey('add_task_field'),
          controller: controller,
        ),
        BlocBuilder<TodoBloc, List<String>>(
          builder: (context, tasks) {
            return ListView.builder(
              key: ValueKey('task_list'),
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemCount: tasks.length,
              itemBuilder: (BuildContext context, int index) {
                final task = tasks[index];
                return TaskItem(
                  key: UniqueKey(),
                  todoBloc: todoBloc,
                  task: task,
                  onCompleted: (direction) => todoBloc.add(
                    RemoveTodoItem(index),
                  ),
                );
              },
            );
          },
        ),
      ],
      floatingActionButton: AddTaskButton(
        key: ValueKey('add_task_button'),
        todoBloc: todoBloc,
        controller: controller,
      ),
    );
  }
}

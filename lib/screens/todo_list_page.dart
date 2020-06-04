import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sandbox/bloc/todo_bloc.dart';
import 'package:flutter_sandbox/views/demo_elements/demo_scaffold.dart';
import 'package:flutter_sandbox/views/todo_elements/add_task_button.dart';
import 'package:flutter_sandbox/views/todo_elements/task_item.dart';
import 'package:flutter_sandbox/views/widget_elements/rounded_text_field.dart';

class TodoListPage extends StatelessWidget {
  TodoListPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final todoBloc = BlocProvider.of<TodoBloc>(context);
    final controller = TextEditingController();
    return DemoScaffold(
      isScrollable: false,
      title: 'Todo List',
      widgets: [
        RoundedTextField(
          key: ValueKey('add_task_field'),
          hintText: 'Enter your task here.',
          controller: controller,
        ),
        BlocBuilder<TodoBloc, List<String>>(
          builder: (context, tasks) {
            return Expanded(
              child: ListView.builder(
                key: ValueKey('task_list'),
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
              ),
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

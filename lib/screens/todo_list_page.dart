import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sandbox/bloc/todo_bloc.dart';
import 'package:flutter_sandbox/views/demo_scaffold.dart';

class TodoListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TodoBloc todoBloc = BlocProvider.of<TodoBloc>(context);
    final controller = TextEditingController();
    return DemoScaffold(
      title: "Todo List",
      widgets: [
        TextField(
            decoration: InputDecoration(
              hintText: 'Enter your task here.',
              contentPadding: EdgeInsets.symmetric(horizontal: 16),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
            ),
            controller: controller),
        BlocBuilder<TodoBloc, List<String>>(
          builder: (context, tasks) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: tasks.length,
              itemBuilder: (BuildContext context, int index) {
                final task = tasks[index];
                return Dismissible(
                  background: ListTile(
                    trailing: Icon(
                      Icons.close,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  key: UniqueKey(),
                  onDismissed: (direction) =>
                      todoBloc.add(RemoveTodoItem(index)),
                  child: ListTile(title: Text(task)),
                );
              },
            );
          },
        ),
      ],
      floatingActionButton: FloatingActionButton(
          onPressed: () => todoBloc.add(AddTodoItem(controller.text)),
          child: Icon(
            Icons.add,
            color: Theme.of(context).canvasColor,
          )),
    );
  }
}

import 'package:flutter/material.dart';

class TodoListPage extends StatefulWidget {
  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final tasks = <String>[];
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Todo List",
      home: Scaffold(
        appBar: AppBar(
          title: Text('Todo List'),
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              TextField(
                controller: controller,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (BuildContext context, int index) {
                    final task = tasks[index];
                    return ListTile(title: Text(task));
                  },
                 )
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                tasks.add(controller.text);
                controller.clear();
              });
            },
            child: Icon(Icons.add)),
      ),
    );
  }
}

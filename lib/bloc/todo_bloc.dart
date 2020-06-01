import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'todo_event.dart';

class TodoBloc extends Bloc<TodoEvent, List<String>> {
  @override
  List<String> get initialState => [];

  @override
  Stream<List<String>> mapEventToState(TodoEvent event) async* {
    final List<String> tasks = List.from(state);
    if (event is AddTodoItem) {
      tasks.add(event.task);
    } else if (event is RemoveTodoItem) {
      tasks.removeAt(event.index);
    }
    yield tasks;
  }
}

part of 'todo_bloc.dart';

@immutable
abstract class TodoEvent {}

class AddTodoItem extends TodoEvent {
  final String task;
  AddTodoItem(this.task);
}

class RemoveTodoItem extends TodoEvent {
  final int index;
  RemoveTodoItem(this.index);
}

part of 'todo_bloc.dart';

@immutable
abstract class TodoEvent {}

class AddTodoItem extends TodoEvent {
  final String task;
  AddTodoItem(this.task) : assert(task != null);
}

class RemoveTodoItem extends TodoEvent {
  final int index;
  RemoveTodoItem(this.index) : assert(index != null);
}

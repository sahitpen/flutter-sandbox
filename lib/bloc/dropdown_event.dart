part of 'dropdown_bloc.dart';

@immutable
abstract class DropdownEvent {}

class SelectItem extends DropdownEvent {
  final String item;
  SelectItem(this.item) : assert(item != null);
}

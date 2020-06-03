import 'dart:async';

import 'package:bloc/bloc.dart';

part 'draggable_event.dart';

class DraggableBloc extends Bloc<DraggableEvent, bool> {
  @override
  bool get initialState => true;

  @override
  Stream<bool> mapEventToState(DraggableEvent event) async* {
    switch (event) {
      case DraggableEvent.DragIncomplete:
        yield true;
        break;
      case DraggableEvent.DragComplete:
        yield false;
        break;
    }
  }
}

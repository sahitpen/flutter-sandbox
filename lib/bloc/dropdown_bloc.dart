import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_sandbox/common/sample_data.dart';
import 'package:meta/meta.dart';

part 'dropdown_event.dart';

class DropdownBloc extends Bloc<DropdownEvent, String> {
  @override
  String get initialState => SampleData.dropdownItems.first;

  @override
  Stream<String> mapEventToState(DropdownEvent event) async* {
    if (event is SelectItem) {
      yield event.item;
    } else {}
  }
}

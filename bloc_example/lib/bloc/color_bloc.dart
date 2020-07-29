import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'color_event.dart';
part 'color_state.dart';

class ColorBloc extends Bloc<ColorEvent, ColorState> {
  @override
  ColorState get initialState => ColorState(Colors.teal);

  @override
  Stream<ColorState> mapEventToState(
    ColorEvent event,
  ) async* {
    yield (event is ToTeal) ? ColorState(Colors.teal) : ColorState(Colors.red);
  }
}

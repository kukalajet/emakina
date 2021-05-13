import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:color_repository/color_repository.dart';

part 'color_event.dart';
part 'color_state.dart';

class ColorBloc extends Bloc<ColorEvent, ColorState> {
  ColorBloc({
    @required ColorRepository colorRepository,
  })  : assert(colorRepository != null),
        _colorRepository = colorRepository,
        super(const ColorState());

  final ColorRepository _colorRepository;

  @override
  Stream<ColorState> mapEventToState(
    ColorEvent event,
  ) async* {
    if (event is ColorFetched) {
      yield await _mapColorFetchedToState(event, state);
    }
  }

  Future<ColorState> _mapColorFetchedToState(
    ColorFetched event,
    ColorState state,
  ) async {
    try {
      final colors = await _colorRepository.fetchColors();
      return state.copyWith(
        status: ColorStatus.success,
        colors: colors,
      );
    } on Exception {
      return state.copyWith(status: ColorStatus.failure);
    }
  }
}

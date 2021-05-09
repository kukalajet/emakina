import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:plate_repository/plate_repository.dart';

part 'plate_event.dart';
part 'plate_state.dart';

class PlateBloc extends Bloc<PlateEvent, PlateState> {
  PlateBloc({
    @required PlateRepository plateRepository,
  })  : assert(plateRepository != null),
        _plateRepository = plateRepository,
        super(const PlateState());

  final PlateRepository _plateRepository;

  @override
  Stream<PlateState> mapEventToState(
    PlateEvent event,
  ) async* {
    if (event is PlateFetched) {
      yield await _mapPlateFetchedToState(event, state);
    }
  }

  Future<PlateState> _mapPlateFetchedToState(
    PlateFetched event,
    PlateState state,
  ) async {
    try {
      final plates = await _plateRepository.fetchPlates();
      return state.copyWith(
        status: PlateStatus.success,
        plates: plates,
      );
    } on Exception {
      return state.copyWith(status: PlateStatus.failure);
    }
  }
}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:fuel_repository/fuel_repository.dart';

part 'fuel_event.dart';
part 'fuel_state.dart';

class FuelBloc extends Bloc<FuelEvent, FuelState> {
  FuelBloc({
    @required FuelRepository fuelRepository,
  })  : assert(fuelRepository != null),
        _fuelRepository = fuelRepository,
        super(const FuelState());

  final FuelRepository _fuelRepository;

  @override
  Stream<FuelState> mapEventToState(
    FuelEvent event,
  ) async* {
    if (event is FuelFetched) {
      yield await _mapFuelFetchedToState(event, state);
    }
  }

  Future<FuelState> _mapFuelFetchedToState(
    FuelFetched event,
    FuelState state,
  ) async {
    try {
      final fuels = await _fuelRepository.fetchFuels();
      return state.copyWith(
        status: FuelStatus.success,
        fuels: fuels,
      );
    } on Exception {
      return state.copyWith(status: FuelStatus.failure);
    }
  }
}

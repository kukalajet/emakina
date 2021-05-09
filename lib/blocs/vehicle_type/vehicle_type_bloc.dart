import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:vehicle_type_repository/vehicle_type_repository.dart';

part 'vehicle_type_event.dart';
part 'vehicle_type_state.dart';

class VehicleTypeBloc extends Bloc<VehicleTypeEvent, VehicleTypeState> {
  VehicleTypeBloc({
    @required TypeRepository typeRepository,
  })  : assert(typeRepository != null),
        _typeRepository = typeRepository,
        super(const VehicleTypeState());

  final TypeRepository _typeRepository;

  @override
  Stream<VehicleTypeState> mapEventToState(
    VehicleTypeEvent event,
  ) async* {
    if (event is VehicleTypeFetched) {
      yield await _mapVehicleTypeFetchedToState(state);
    }
  }

  Future<VehicleTypeState> _mapVehicleTypeFetchedToState(
      VehicleTypeState state) async {
    try {
      final types = await _typeRepository.fetchTypes();
      return state.copyWith(
        status: VehicleTypeStatus.success,
        types: types,
      );
    } on Exception {
      return state.copyWith(status: VehicleTypeStatus.failure);
    }
  }
}

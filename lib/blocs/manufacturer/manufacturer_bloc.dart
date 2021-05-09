import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:manufacturer_repository/manufacturer_repository.dart';

part 'manufacturer_event.dart';
part 'manufacturer_state.dart';

class ManufacturerBloc extends Bloc<ManufacturerEvent, ManufacturerState> {
  ManufacturerBloc({
    @required ManufacturerRepository manufacturerRepository,
  })  : assert(manufacturerRepository != null),
        _manufacturerRepository = manufacturerRepository,
        super(const ManufacturerState());

  final ManufacturerRepository _manufacturerRepository;

  @override
  Stream<ManufacturerState> mapEventToState(
    ManufacturerEvent event,
  ) async* {
    if (event is ManufacturerFetched) {
      yield await _mapManufacturerFetchedToState(state);
    }
  }

  Future<ManufacturerState> _mapManufacturerFetchedToState(
      ManufacturerState state) async {
    try {
      final manufacturers = await _manufacturerRepository.fetchManufacturers();
      return state.copyWith(
        status: ManufacturerStatus.success,
        manufacturers: manufacturers,
      );
    } on Exception {
      return state.copyWith(status: ManufacturerStatus.failure);
    }
  }
}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:transmission_repository/transmission_repository.dart';

part 'transmission_event.dart';
part 'transmission_state.dart';

class TransmissionBloc extends Bloc<TransmissionEvent, TransmissionState> {
  TransmissionBloc({
    @required TransmissionRepository transmissionRepository,
  })  : assert(transmissionRepository != null),
        _transmissionRepository = transmissionRepository,
        super(const TransmissionState());

  final TransmissionRepository _transmissionRepository;

  @override
  Stream<TransmissionState> mapEventToState(
    TransmissionEvent event,
  ) async* {
    if (event is TransmissionFetched) {
      yield await _mapTransmissionFetchedToState(event, state);
    }
  }

  Future<TransmissionState> _mapTransmissionFetchedToState(
    TransmissionFetched event,
    TransmissionState state,
  ) async {
    try {
      final transmissions = await _transmissionRepository.fetchTransmissions();
      return state.copyWith(
        status: TransmissionStatus.success,
        transmissions: transmissions,
      );
    } on Exception {
      return state.copyWith(status: TransmissionStatus.failure);
    }
  }
}

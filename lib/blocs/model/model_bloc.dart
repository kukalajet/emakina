import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:model_repository/model_repository.dart';

part 'model_event.dart';
part 'model_state.dart';

class ModelBloc extends Bloc<ModelEvent, ModelState> {
  ModelBloc({
    @required ModelRepository modelRepository,
  })  : assert(modelRepository != null),
        _modelRepository = modelRepository,
        super(const ModelState());

  final ModelRepository _modelRepository;

  @override
  Stream<ModelState> mapEventToState(
    ModelEvent event,
  ) async* {
    if (event is ModelFetched) {
      yield await _mapModelFetchedToState(event, state);
    }
  }

  Future<ModelState> _mapModelFetchedToState(
    ModelFetched event,
    ModelState state,
  ) async {
    try {
      final manufacturerId = event.manufacturerId;
      final models = await _modelRepository.fetchModels(manufacturerId);
      return state.copyWith(
        status: ModelStatus.success,
        models: models,
      );
    } on Exception {
      return state.copyWith(status: ModelStatus.failure);
    }
  }
}

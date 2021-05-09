part of 'model_bloc.dart';

enum ModelStatus { initial, success, failure }

class ModelState extends Equatable {
  const ModelState({
    this.status = ModelStatus.initial,
    this.models = const <Model>[],
  });

  final ModelStatus status;
  final List<Model> models;

  ModelState copyWith({
    ModelStatus status,
    List<Model> models,
  }) {
    return ModelState(
      status: status ?? this.status,
      models: models ?? this.models,
    );
  }

  @override
  List<Object> get props => [status, models];
}

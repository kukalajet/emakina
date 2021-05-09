part of 'model_bloc.dart';

abstract class ModelEvent extends Equatable {
  const ModelEvent();

  @override
  List<Object> get props => [];
}

class ModelFetched extends ModelEvent {
  const ModelFetched({
    @required this.manufacturerId,
  });

  final int manufacturerId;

  @override
  List<Object> get props => [manufacturerId];
}

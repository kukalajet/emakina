import 'package:bloc/bloc.dart';
import 'package:color_repository/color_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:emakina/validations/validations.dart';
import 'package:fuel_repository/fuel_repository.dart';
import 'package:transmission_repository/transmission_repository.dart';

part 'third_creation_form_event.dart';
part 'third_creation_form_state.dart';

class ThirdCreationFormBloc
    extends Bloc<ThirdCreationFormEvent, ThirdCreationFormState> {
  ThirdCreationFormBloc() : super(const ThirdCreationFormState());

  @override
  Stream<ThirdCreationFormState> mapEventToState(
    ThirdCreationFormEvent event,
  ) async* {
    if (event is CreationColorChanged) {
      yield _mapCreationColorChangedToState(event, state);
    } else if (event is CreationFuelChanged) {
      yield _mapCreationFuelsChangedToState(event, state);
    } else if (event is CreationImageAdded) {
      yield _mapCreationImageAddedToState(event, state);
    } else if (event is CreationImageRemoved) {
      yield _mapCreationImageRemovedToState(event, state);
    } else if (event is CreationTransmissionChanged) {
      yield _mapCreationTransmissionChangedToState(event, state);
    }
  }

  ThirdCreationFormState _mapCreationColorChangedToState(
    CreationColorChanged event,
    ThirdCreationFormState state,
  ) {
    final color = ColorField.dirty(event.color);
    return state.copyWith(
      color: color,
      status: Formz.validate([
        color,
        state.fuel,
        state.images,
        state.transmission,
      ]),
    );
  }

  ThirdCreationFormState _mapCreationFuelsChangedToState(
    CreationFuelChanged event,
    ThirdCreationFormState state,
  ) {
    final fuel = FuelField.dirty(event.fuel);
    return state.copyWith(
      fuel: fuel,
      status: Formz.validate([
        state.color,
        fuel,
        state.images,
        state.transmission,
      ]),
    );
  }

  ThirdCreationFormState _mapCreationImageAddedToState(
    CreationImageAdded event,
    ThirdCreationFormState state,
  ) {
    final image = event.image;
    final stateImages = state.images.value;
    final currentImages =
        List.from(stateImages != null ? stateImages : []).cast<String>();
    final images = ImagesField.dirty(currentImages..add(image));
    return state.copyWith(
      images: images,
      status: Formz.validate([
        state.color,
        state.fuel,
        images,
        state.transmission,
      ]),
    );
  }

  ThirdCreationFormState _mapCreationImageRemovedToState(
    CreationImageRemoved event,
    ThirdCreationFormState state,
  ) {
    final image = event.image;
    final stateImages = state.images.value;
    final currentImages =
        List.from(stateImages != null ? stateImages : []).cast<String>();
    final images = ImagesField.dirty(currentImages..remove(image));
    return state.copyWith(
      images: images,
      status: Formz.validate([
        state.color,
        state.fuel,
        images,
        state.transmission,
      ]),
    );
  }

  ThirdCreationFormState _mapCreationTransmissionChangedToState(
    CreationTransmissionChanged event,
    ThirdCreationFormState state,
  ) {
    final transmission = TransmissionField.dirty(event.transmission);
    return state.copyWith(
      transmission: transmission,
      status: Formz.validate([
        state.color,
        state.fuel,
        state.images,
        transmission,
      ]),
    );
  }
}

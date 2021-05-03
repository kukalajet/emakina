import 'package:bloc/bloc.dart';
import 'package:color_repository/color_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:emakina/forms/forms.dart';
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
    } else if (event is CreationFuelsChanged) {
      yield _mapCreationFuelsChangedToState(event, state);
    } else if (event is CreationImagesChanged) {
      yield _mapCreationImagesChangedToState(event, state);
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
        state.fuels,
        state.images,
        state.transmission,
      ]),
    );
  }

  ThirdCreationFormState _mapCreationFuelsChangedToState(
    CreationFuelsChanged event,
    ThirdCreationFormState state,
  ) {
    final fuels = FuelsField.dirty(event.fuels);
    return state.copyWith(
      fuels: fuels,
      status: Formz.validate([
        state.color,
        fuels,
        state.images,
        state.transmission,
      ]),
    );
  }

  ThirdCreationFormState _mapCreationImagesChangedToState(
    CreationImagesChanged event,
    ThirdCreationFormState state,
  ) {
    final images = ImagesField.dirty(event.images);
    return state.copyWith(
      images: images,
      status: Formz.validate([
        state.color,
        state.fuels,
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
        state.fuels,
        state.images,
        transmission,
      ]),
    );
  }
}

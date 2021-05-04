import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:emakina/validations/validations.dart';
import 'package:listing_repository/listing_repository.dart';
import 'package:location_repository/location_repository.dart';
import 'package:valute_repository/valute_repository.dart';

part 'first_creation_form_event.dart';
part 'first_creation_form_state.dart';

class FirstCreationFormBloc
    extends Bloc<FirstCreationFormEvent, FirstCreationFormState> {
  FirstCreationFormBloc() : super(const FirstCreationFormState());

  @override
  Stream<FirstCreationFormState> mapEventToState(
    FirstCreationFormEvent event,
  ) async* {
    if (event is CreationTitleChanged) {
      yield _mapCreationTitleChangedToState(event, state);
    } else if (event is CreationDescriptionChanged) {
      yield _mapCreationDescriptionChangedToState(event, state);
    } else if (event is CreationPriceChanged) {
      yield _mapCreationPriceChangedToState(event, state);
    } else if (event is CreationValuteChanged) {
      yield _mapCreationValuteChangedToState(event, state);
    } else if (event is CreationMatriculationChanged) {
      yield _mapCreationMatriculationChangedToState(event, state);
    } else if (event is CreationLocationChanged) {
      yield _mapCreationLocationChangedToState(event, state);
    }
  }

  FirstCreationFormState _mapCreationTitleChangedToState(
    CreationTitleChanged event,
    FirstCreationFormState state,
  ) {
    final title = TitleField.dirty(event.title);
    return state.copyWith(
      title: title,
      status: Formz.validate([
        title,
        state.description,
        state.price,
        state.valute,
        state.matriculation,
        state.location,
      ]),
    );
  }

  FirstCreationFormState _mapCreationDescriptionChangedToState(
    CreationDescriptionChanged event,
    FirstCreationFormState state,
  ) {
    final description = DescriptionField.dirty(event.description);
    return state.copyWith(
      description: description,
      status: Formz.validate([
        state.title,
        description,
        state.price,
        state.valute,
        state.matriculation,
        state.location,
      ]),
    );
  }

  FirstCreationFormState _mapCreationPriceChangedToState(
    CreationPriceChanged event,
    FirstCreationFormState state,
  ) {
    final price = PriceField.dirty(event.price);
    return state.copyWith(
      price: price,
      status: Formz.validate([
        state.title,
        state.description,
        price,
        state.valute,
        state.matriculation,
        state.location,
      ]),
    );
  }

  FirstCreationFormState _mapCreationValuteChangedToState(
    CreationValuteChanged event,
    FirstCreationFormState state,
  ) {
    final valute = ValuteField.dirty(event.valute);
    return state.copyWith(
      valute: valute,
      status: Formz.validate([
        state.title,
        state.description,
        state.price,
        valute,
        state.matriculation,
        state.location,
      ]),
    );
  }

  FirstCreationFormState _mapCreationMatriculationChangedToState(
    CreationMatriculationChanged event,
    FirstCreationFormState state,
  ) {
    final matriculation = MatriculationField.dirty(event.matriculation);
    return state.copyWith(
      matriculation: matriculation,
      status: Formz.validate([
        state.title,
        state.description,
        state.price,
        state.valute,
        matriculation,
        state.location,
      ]),
    );
  }

  FirstCreationFormState _mapCreationLocationChangedToState(
    CreationLocationChanged event,
    FirstCreationFormState state,
  ) {
    final location = LocationField.dirty(event.location);
    return state.copyWith(
      location: location,
      status: Formz.validate([
        state.title,
        state.description,
        state.price,
        state.valute,
        state.matriculation,
        location,
      ]),
    );
  }
}

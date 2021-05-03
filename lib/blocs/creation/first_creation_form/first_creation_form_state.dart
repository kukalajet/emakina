part of 'first_creation_form_bloc.dart';

class FirstCreationFormState extends Equatable {
  const FirstCreationFormState({
    this.status = FormzStatus.pure,
    this.title = const TitleField.pure(),
    this.description = const DescriptionField.pure(),
    this.price = const PriceField.pure(),
    this.valute = const ValuteField.pure(),
    this.matriculation = const MatriculationField.pure(),
    this.location = const LocationField.pure(),
  });

  final FormzStatus status;
  final TitleField title;
  final DescriptionField description;
  final PriceField price;
  final ValuteField valute;
  final MatriculationField matriculation;
  final LocationField location;

  FirstCreationFormState copyWith({
    FormzStatus status,
    TitleField title,
    DescriptionField description,
    PriceField price,
    ValuteField valute,
    MatriculationField matriculation,
    LocationField location,
  }) {
    return FirstCreationFormState(
      status: status ?? this.status,
      title: title ?? this.title,
      description: description ?? this.description,
      price: price ?? this.price,
      valute: valute ?? this.valute,
      matriculation: matriculation ?? this.matriculation,
      location: location ?? this.location,
    );
  }

  bool get valid => status == FormzStatus.valid;

  @override
  List<Object> get props => [
        status,
        title,
        description,
        price,
        valute,
        matriculation,
        location,
      ];
}

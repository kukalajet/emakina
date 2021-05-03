part of 'third_creation_form_bloc.dart';

class ThirdCreationFormState extends Equatable {
  const ThirdCreationFormState({
    this.status = FormzStatus.pure,
    this.color = const ColorField.pure(),
    this.fuels = const FuelsField.pure(),
    this.images = const ImagesField.pure(),
    this.transmission = const TransmissionField.pure(),
  });

  final FormzStatus status;
  final ColorField color;
  final FuelsField fuels;
  final ImagesField images;
  final TransmissionField transmission;

  ThirdCreationFormState copyWith({
    FormzStatus status,
    ColorField color,
    FuelsField fuels,
    ImagesField images,
    TransmissionField transmission,
  }) {
    return ThirdCreationFormState(
      status: status ?? this.status,
      color: color ?? this.color,
      fuels: fuels ?? this.fuels,
      images: images ?? this.images,
      transmission: transmission ?? this.transmission,
    );
  }

  bool get valid => status == FormzStatus.valid;

  @override
  List<Object> get props => [
        status,
        color,
        fuels,
        images,
        transmission,
      ];
}

part of 'color_bloc.dart';

enum ColorStatus { initial, success, failure }

class ColorState extends Equatable {
  const ColorState({
    this.status = ColorStatus.initial,
    this.colors = const <Color>[],
  });

  final ColorStatus status;
  final List<Color> colors;

  ColorState copyWith({
    ColorStatus status,
    List<Color> colors,
  }) {
    return ColorState(
      status: status ?? this.status,
      colors: colors ?? this.colors,
    );
  }

  @override
  List<Object> get props => [status, colors];
}

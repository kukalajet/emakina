import 'package:flutter/foundation.dart';
import 'package:equatable/equatable.dart';

class Color extends Equatable {
  const Color({
    @required this.id,
    @required this.name,
    @required this.code,
  });

  final int id;
  final String name;
  final String code;

  @override
  String toString() => '{ "id": "$id", "name": "$name", "code": "$code" }';

  factory Color.fromJson(Map<String, dynamic> json) {
    return Color(
      id: int.parse(json['id']),
      name: json['name'],
      code: json['code'],
    );
  }

  @override
  List<Object> get props => [
        id,
        name,
        code,
      ];
}

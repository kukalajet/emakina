import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class Plate extends Equatable {
  const Plate({
    @required this.id,
    @required this.name,
  });

  final int id;
  final String name;

  @override
  String toString() => '{ "id": "$id", "name": "$name" }';

  factory Plate.fromJson(Map<String, dynamic> json) {
    return Plate(
      id: int.parse(json['id']),
      name: json['name'],
    );
  }

  @override
  List<Object> get props => [
        id,
        name,
      ];
}

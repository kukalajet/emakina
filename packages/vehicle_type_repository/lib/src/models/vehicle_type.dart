import 'package:flutter/foundation.dart';
import 'package:equatable/equatable.dart';

class VehicleType extends Equatable {
  const VehicleType({
    @required this.id,
    @required this.name,
  });

  final int id;
  final String name;

  @override
  String toString() => '{ "id": "$id", "name": "$name" }';

  factory VehicleType.fromJson(Map<String, dynamic> json) {
    return VehicleType(
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

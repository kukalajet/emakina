import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class Manufacturer extends Equatable {
  const Manufacturer({
    @required this.id,
    @required this.name,
  });

  final int id;
  final String name;

  @override
  String toString() => '{ "id": "$id", "name": "$name" }';

  factory Manufacturer.fromJson(Map<String, dynamic> json) {
    return Manufacturer(
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

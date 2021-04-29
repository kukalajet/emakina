import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class Location extends Equatable {
  const Location({
    @required this.id,
    @required this.name,
  });

  final int id;
  final String name;

  @override
  String toString() => '{ "id": "$id", "name": "$name" }';

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
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

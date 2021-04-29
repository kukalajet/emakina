import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class Fuel extends Equatable {
  const Fuel({
    @required this.id,
    @required this.type,
  });

  final int id;
  final String type;

  @override
  String toString() => '{ "id": "$id", "type": "$type" }';

  factory Fuel.fromJson(Map<String, dynamic> json) {
    return Fuel(
      id: int.parse(json['id']),
      type: json['type'],
    );
  }

  @override
  List<Object> get props => [
        id,
        type,
      ];
}

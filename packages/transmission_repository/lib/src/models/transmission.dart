import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class Transmission extends Equatable {
  const Transmission({
    @required this.id,
    @required this.type,
  });

  final int id;
  final String type;

  @override
  String toString() => '{ "id": "$id", "type": "$type" }';

  factory Transmission.fromJson(Map<String, dynamic> json) {
    return Transmission(
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

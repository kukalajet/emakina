import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class Model extends Equatable {
  const Model({
    @required this.id,
    @required this.name,
  });

  final int id;
  final String name;

  @override
  String toString() => '{ "id": "$id", "name": "$name" }';

  factory Model.fromJson(Map<String, dynamic> json) {
    return Model(
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

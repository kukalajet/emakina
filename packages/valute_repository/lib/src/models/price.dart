import 'package:flutter/foundation.dart';
import 'models.dart';

class Price {
  const Price({
    @required this.value,
    @required this.valute,
  });

  final double value;
  final Valute valute;

  factory Price.fromJson(Map<String, dynamic> json) {
    return Price(
      value: json['value'],
      valute: Valute.fromJson(json['valute']),
    );
  }

  @override
  String toString() => '{ "value": $value, "valute": $valute }';
}

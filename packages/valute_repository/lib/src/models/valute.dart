import 'package:flutter/foundation.dart';

class Valute {
  const Valute({
    @required this.id,
    @required this.name,
    @required this.symbol,
  });

  final int id;
  final String name;
  final String symbol;

  static Valute leke() => Valute(id: 0, name: 'Lekë', symbol: 'L');
  static Valute euro() => Valute(id: 1, name: 'Euro', symbol: '€');
  static Valute dollar() => Valute(id: 2, name: 'Dollar', symbol: '\$');
  static Valute pound() => Valute(id: 3, name: 'Pound', symbol: '£');

  factory Valute.fromJson(Map<String, dynamic> json) {
    return Valute(
      id: int.parse(json['id']),
      name: json['name'],
      symbol: json['symbol'],
    );
  }

  @override
  String toString() => '{ id: $id, name: $name, symbol: $symbol }';
}

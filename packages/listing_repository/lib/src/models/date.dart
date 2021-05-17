import 'package:flutter/foundation.dart';

class Date {
  final int day;
  final int month;
  final int year;

  const Date({
    @required this.day,
    @required this.month,
    @required this.year,
  });

  static Date upperValue() => Date(day: 1, month: 1, year: 2021);
  static Date lowerValue() => Date(day: 1, month: 1, year: 1990);

  @override
  String toString() => '{ "day": $day, "month": $month, "year": $year}';

  factory Date.fromJson(Map<String, dynamic> json) {
    return Date(
      day: int.parse(json['day']),
      month: int.parse(json['month']),
      year: int.parse(json['year']),
    );
  }
}

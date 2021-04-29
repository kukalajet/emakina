import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:fuel_repository/src/models/models.dart';

class FuelRepository {
  const FuelRepository({@required this.httpClient});

  final http.Client httpClient;

  /// TODO: Types should be retrieved from shared prefs, if nothing is there, we should ask the BE.
  Future<List<Fuel>> fetchFuels() async {
    List<Fuel> fuels = <Fuel>[
      Fuel(id: 0, type: 'Petrol'),
      Fuel(id: 1, type: 'Diesel'),
      Fuel(id: 2, type: 'Electric'),
    ];

    return fuels;
  }
}

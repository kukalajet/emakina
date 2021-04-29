import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:vehicle_type_repository/src/models/models.dart';

import 'models/vehicle_type.dart';

class TypeRepository {
  const TypeRepository({@required this.httpClient});

  final http.Client httpClient;

  /// TODO: Types should be retrieved from shared prefs, if nothing is there, we should ask the BE.
  Future<List<VehicleType>> fetchTypes() async {
    List<VehicleType> fuels = <VehicleType>[
      VehicleType(id: 0, name: 'IndianRed'),
      VehicleType(id: 0, name: 'LightCoral'),
      VehicleType(id: 0, name: 'Salmon'),
    ];

    return fuels;
  }
}

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:location_repository/src/models/models.dart';

class LocationRepository {
  const LocationRepository({@required this.httpClient});

  final http.Client httpClient;

  /// TODO: Types should be retrieved from shared prefs, if nothing is there, we should ask the BE.
  Future<List<Location>> fetchLocations() async {
    List<Location> locations = <Location>[
      Location(id: 0, name: 'Tirana'),
      Location(id: 0, name: 'Durres'),
    ];

    return locations;
  }
}

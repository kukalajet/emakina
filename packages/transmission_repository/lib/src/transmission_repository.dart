import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:transmission_repository/src/models/models.dart';

class TransmissionRepository {
  const TransmissionRepository({@required this.httpClient});

  final http.Client httpClient;

  /// TODO: Types should be retrieved from shared prefs, if nothing is there, we should ask the BE.
  Future<List<Transmission>> fetchTransmissions() async {
    List<Transmission> transmissions = <Transmission>[
      Transmission(id: 0, type: 'Manual'),
      Transmission(id: 0, type: 'Durres'),
    ];

    return transmissions;
  }
}

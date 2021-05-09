import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:plate_repository/src/models/models.dart';

class PlateRepository {
  PlateRepository({@required this.httpClient});

  final http.Client httpClient;

  Future<List<Plate>> fetchPlates() async {
    List<Plate> models = <Plate>[
      Plate(id: 0, name: 'Albania'),
      Plate(id: 1, name: 'Italy'),
      Plate(id: 2, name: 'Germany'),
      Plate(id: 3, name: 'Kosovo'),
      Plate(id: 4, name: 'France'),
    ];

    return Future.delayed(
      const Duration(milliseconds: 500),
      () => models,
    );
  }
}

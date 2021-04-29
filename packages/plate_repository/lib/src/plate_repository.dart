import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:plate_repository/src/models/models.dart';

class PlateRepository {
  PlateRepository({@required this.httpClient});

  final http.Client httpClient;

  Future<List<Plate>> fetchPlates(int manufacturerId) async {
    List<Plate> models = <Plate>[
      Plate(id: 0, name: 'Honda Motor Company'),
      Plate(id: 1, name: 'Fiat Chrysler Automobiles'),
      Plate(id: 2, name: 'Volkswagen Group'),
      Plate(id: 3, name: 'BMW Group'),
      Plate(id: 4, name: 'Volkswagen Group'),
      Plate(id: 5, name: 'General Motors'),
      Plate(id: 6, name: 'Ford Motor Co.'),
      Plate(id: 7, name: 'Hyundai Motor Group'),
      Plate(id: 8, name: 'Renault-Nissan-Mitsubishi Alliance'),
      Plate(id: 9, name: 'Tata Motors'),
      Plate(id: 10, name: 'Toyota Motor Corp.'),
    ];

    return Future.delayed(
      const Duration(milliseconds: 500),
      () => models,
    );
  }
}

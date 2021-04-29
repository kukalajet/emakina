import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:manufacturer_repository/src/models/models.dart';

class ManufacturerRepository {
  final http.Client httpClient;

  ManufacturerRepository({@required this.httpClient});

  Future<List<Manufacturer>> fetchManufacturers(
    int startIndex,
    int limit,
  ) async {
    List<Manufacturer> brands = <Manufacturer>[
      Manufacturer(id: 0, name: 'Honda Motor Company'),
      Manufacturer(id: 1, name: 'Fiat Chrysler Automobiles'),
      Manufacturer(id: 2, name: 'Volkswagen Group'),
      Manufacturer(id: 3, name: 'BMW Group'),
      Manufacturer(id: 4, name: 'Volkswagen Group'),
      Manufacturer(id: 5, name: 'General Motors'),
      Manufacturer(id: 6, name: 'Ford Motor Co.'),
      Manufacturer(id: 7, name: 'Hyundai Motor Group'),
      Manufacturer(id: 8, name: 'Renault-Nissan-Mitsubishi Alliance'),
      Manufacturer(id: 9, name: 'Tata Motors'),
      Manufacturer(id: 10, name: 'Toyota Motor Corp.'),
      Manufacturer(id: 11, name: 'Zhejiang Geely Holding Group'),
      Manufacturer(id: 12, name: 'Mazda Motor Corp.'),
      Manufacturer(id: 13, name: 'Daimler AG'),
      Manufacturer(id: 14, name: 'Nikola Motor Company'),
      Manufacturer(id: 15, name: 'Rivian Automotive'),
      Manufacturer(id: 16, name: 'Tesla Inc.'),
      Manufacturer(id: 17, name: 'Nikola Motor Company'),
      Manufacturer(id: 18, name: 'Rivian Automotive'),
      Manufacturer(id: 19, name: 'Tesla Inc.'),
    ];

    return Future.delayed(
      const Duration(milliseconds: 500),
      () => brands,
    );
  }
}

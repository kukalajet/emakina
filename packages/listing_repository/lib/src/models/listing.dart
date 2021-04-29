import 'dart:convert';
import 'package:color_repository/color_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:equatable/equatable.dart';
import 'package:fuel_repository/fuel_repository.dart';
import 'package:location_repository/location_repository.dart';
import 'package:manufacturer_repository/manufacturer_repository.dart';
import 'package:model_repository/model_repository.dart';
import 'package:plate_repository/plate_repository.dart';
import 'package:transmission_repository/transmission_repository.dart';
import 'package:valute_repository/valute_repository.dart';
import 'package:vehicle_type_repository/vehicle_type_repository.dart';

class Listing extends Equatable {
  const Listing({
    @required this.id,
    @required this.type,
    @required this.transmission,
    @required this.year,
    @required this.mileage,
    @required this.fuels,
    @required this.urls,
    @required this.plate,
    @required this.color,
    @required this.location,
    @required this.manufacturer,
    @required this.model,
    @required this.price,
  });

  final int id;
  final VehicleType type;
  final Transmission transmission;
  final int year;
  final int mileage;
  final List<Fuel> fuels;
  final List<String> urls;
  final Plate plate;
  final Color color;
  final Location location;
  final Manufacturer manufacturer;
  final Model model;
  final Price price;

  @override
  String toString() =>
      '{ "id": $id, "type": $type, "transmission": $transmission, "year": $year, "mileage": $mileage, "fuels": $fuels, "urls": ${jsonEncode(urls)}, "plate": $plate, "color": $color, "location": $location, "manufacturer": $manufacturer, "model": $model, "price": $price }';

  factory Listing.fromJson(Map<String, dynamic> json) {
    return Listing(
      id: json['id'],
      type: VehicleType.fromJson(json['type']),
      transmission: Transmission.fromJson(json['transmission']),
      mileage: json['mileage'],
      year: json['year'],
      fuels:
          (json['fuels'] as List).map((fuel) => Fuel.fromJson(fuel)).toList(),
      urls: (json['urls'] as List).map((url) => url).toList(),
      plate: Plate.fromJson(json['plate']),
      color: Color.fromJson(json['color']),
      location: Location.fromJson(json['location']),
      manufacturer: Manufacturer.fromJson(json['manufacturer']),
      model: Model.fromJson(json['model']),
      price: Price.fromJson(json['price']),
    );
  }

  @override
  List<Object> get props => [
        id,
        type,
        transmission,
        mileage,
        fuels,
        urls,
        plate,
        color,
        location,
        manufacturer,
        model,
        price,
      ];
}

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
    @required this.title,
    @required this.description,
    @required this.type,
    @required this.transmission,
    @required this.year,
    @required this.mileage,
    @required this.fuel,
    @required this.images,
    @required this.plate,
    @required this.color,
    @required this.location,
    @required this.manufacturer,
    @required this.model,
    @required this.price,
    @required this.isFavorite,
  });

  final int id;
  final String title;
  final String description;
  final VehicleType type;
  final Transmission transmission;
  final int year;
  final int mileage;
  final Fuel fuel;
  final List<String> images;
  final Plate plate;
  final Color color;
  final Location location;
  final Manufacturer manufacturer;
  final Model model;
  final Price price;
  final bool isFavorite;

  Listing copyWith({
    int id,
    String title,
    String description,
    VehicleType type,
    Transmission transmission,
    int year,
    int mileage,
    List<Fuel> fuels,
    List<String> images,
    Plate plate,
    Color color,
    Location location,
    Manufacturer manufacturer,
    Model model,
    Price price,
    bool isFavorite,
  }) {
    return Listing(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      type: type ?? this.type,
      transmission: transmission ?? this.transmission,
      mileage: mileage ?? this.mileage,
      year: year ?? this.year,
      fuel: fuels ?? this.fuel,
      images: images ?? this.images,
      plate: plate ?? this.plate,
      color: color ?? this.color,
      location: location ?? this.location,
      manufacturer: manufacturer ?? this.manufacturer,
      model: model ?? this.model,
      price: price ?? this.price,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  @override
  String toString() =>
      '{ "id": $id, "type": $type, "transmission": $transmission, "year": $year, "mileage": $mileage, "fuel": $fuel, "images": ${jsonEncode(images)}, "plate": $plate, "color": $color, "location": $location, "manufacturer": $manufacturer, "model": $model, "price": $price, "isFavorite": $isFavorite }';

  factory Listing.fromJson(Map<String, dynamic> json) {
    return Listing(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      type: VehicleType.fromJson(json['type']),
      transmission: Transmission.fromJson(json['transmission']),
      mileage: json['mileage'],
      year: json['year'],
      fuel: Fuel.fromJson(json['fuel']),
      images: (json['images'] as List).map((url) => url as String).toList(),
      plate: Plate.fromJson(json['plate']),
      color: Color.fromJson(json['color']),
      location: Location.fromJson(json['location']),
      manufacturer: Manufacturer.fromJson(json['manufacturer']),
      model: Model.fromJson(json['model']),
      price: Price.fromJson(json['price']),
      isFavorite: json['isFavorite'],
    );
  }

  @override
  List<Object> get props => [
        id,
        type,
        transmission,
        mileage,
        fuel,
        images,
        plate,
        color,
        location,
        manufacturer,
        model,
        price,
        isFavorite,
      ];
}

import 'package:color_repository/color_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:fuel_repository/fuel_repository.dart';
import 'package:http/http.dart' as http;
import 'package:listing_repository/src/models/models.dart';
import 'package:location_repository/location_repository.dart';
import 'package:manufacturer_repository/manufacturer_repository.dart';
import 'package:model_repository/model_repository.dart';
import 'package:plate_repository/plate_repository.dart';
import 'package:transmission_repository/transmission_repository.dart';
import 'package:valute_repository/valute_repository.dart';
import 'package:vehicle_type_repository/vehicle_type_repository.dart';

class ListingRepository {
  ListingRepository({@required this.httpClient});

  final http.Client httpClient;

  final List<Listing> _listings = <Listing>[
    Listing(
      id: 0,
      type: VehicleType(id: 0, name: 'SUV'),
      transmission: Transmission(id: 0, type: 'test'),
      year: 2001,
      mileage: 100000,
      fuels: [
        Fuel(id: 0, type: 'test'),
      ],
      urls: [
        "https://media.merrjep.al/Image/571684d2ac2c49199929127601bf9667/20210417/false/false/1280/960/RANGE-ROVER-SPORT--VITI-2015--AUTOMATIKE--MOTORR-3-0-NAFTE.jpeg?noLogo=true",
        "https://media.merrjep.al/Image/b5680d074c384ec6bce46dd927548d86/20210417/false/false/1280/960/RANGE-ROVER-SPORT--VITI-2015--AUTOMATIKE--MOTORR-3-0-NAFTE.jpeg?noLogo=true",
        "https://media.merrjep.al/Image/c49d82e1e1664df7994d1e8b14a8b0e5/20210417/false/false/1280/960/RANGE-ROVER-SPORT--VITI-2015--AUTOMATIKE--MOTORR-3-0-NAFTE.jpeg?noLogo=true",
      ],
      plate: Plate(id: 0, name: 'test'),
      color: Color(id: 0, name: 'red', code: '#WQESAD1'),
      location: Location(id: 0, name: 'test'),
      manufacturer: Manufacturer(id: 0, name: 'Renault'),
      model: Model(id: 0, name: 'Megan Scenic'),
      price: Price(value: 2000, valute: Valute.euro()),
      isFavorite: false,
    ),
    Listing(
      id: 1,
      type: VehicleType(id: 0, name: 'SUV'),
      transmission: Transmission(id: 0, type: 'test'),
      year: 2001,
      mileage: 100000,
      fuels: [
        Fuel(id: 0, type: 'test'),
      ],
      urls: [
        "https://media.merrjep.al/Image/571684d2ac2c49199929127601bf9667/20210417/false/false/1280/960/RANGE-ROVER-SPORT--VITI-2015--AUTOMATIKE--MOTORR-3-0-NAFTE.jpeg?noLogo=true",
        "https://media.merrjep.al/Image/b5680d074c384ec6bce46dd927548d86/20210417/false/false/1280/960/RANGE-ROVER-SPORT--VITI-2015--AUTOMATIKE--MOTORR-3-0-NAFTE.jpeg?noLogo=true",
        "https://media.merrjep.al/Image/c49d82e1e1664df7994d1e8b14a8b0e5/20210417/false/false/1280/960/RANGE-ROVER-SPORT--VITI-2015--AUTOMATIKE--MOTORR-3-0-NAFTE.jpeg?noLogo=true",
      ],
      plate: Plate(id: 0, name: 'test'),
      color: Color(id: 0, name: 'red', code: '#WQESAD1'),
      location: Location(id: 0, name: 'test'),
      manufacturer: Manufacturer(id: 0, name: 'Renault'),
      model: Model(id: 0, name: 'Megan Scenic'),
      price: Price(value: 2000, valute: Valute.euro()),
      isFavorite: false,
    ),
    Listing(
      id: 2,
      type: VehicleType(id: 0, name: 'SUV'),
      transmission: Transmission(id: 0, type: 'test'),
      year: 2001,
      mileage: 100000,
      fuels: [
        Fuel(id: 0, type: 'test'),
      ],
      urls: [
        "https://media.merrjep.al/Image/571684d2ac2c49199929127601bf9667/20210417/false/false/1280/960/RANGE-ROVER-SPORT--VITI-2015--AUTOMATIKE--MOTORR-3-0-NAFTE.jpeg?noLogo=true",
        "https://media.merrjep.al/Image/b5680d074c384ec6bce46dd927548d86/20210417/false/false/1280/960/RANGE-ROVER-SPORT--VITI-2015--AUTOMATIKE--MOTORR-3-0-NAFTE.jpeg?noLogo=true",
        "https://media.merrjep.al/Image/c49d82e1e1664df7994d1e8b14a8b0e5/20210417/false/false/1280/960/RANGE-ROVER-SPORT--VITI-2015--AUTOMATIKE--MOTORR-3-0-NAFTE.jpeg?noLogo=true",
      ],
      plate: Plate(id: 0, name: 'test'),
      color: Color(id: 0, name: 'red', code: '#WQESAD1'),
      location: Location(id: 0, name: 'test'),
      manufacturer: Manufacturer(id: 0, name: 'Renault'),
      model: Model(id: 0, name: 'Megan Scenic'),
      price: Price(value: 2000, valute: Valute.euro()),
      isFavorite: false,
    ),
    Listing(
      id: 3,
      type: VehicleType(id: 0, name: 'SUV'),
      transmission: Transmission(id: 0, type: 'test'),
      year: 2001,
      mileage: 100000,
      fuels: [
        Fuel(id: 0, type: 'test'),
      ],
      urls: [
        "https://media.merrjep.al/Image/571684d2ac2c49199929127601bf9667/20210417/false/false/1280/960/RANGE-ROVER-SPORT--VITI-2015--AUTOMATIKE--MOTORR-3-0-NAFTE.jpeg?noLogo=true",
        "https://media.merrjep.al/Image/b5680d074c384ec6bce46dd927548d86/20210417/false/false/1280/960/RANGE-ROVER-SPORT--VITI-2015--AUTOMATIKE--MOTORR-3-0-NAFTE.jpeg?noLogo=true",
        "https://media.merrjep.al/Image/c49d82e1e1664df7994d1e8b14a8b0e5/20210417/false/false/1280/960/RANGE-ROVER-SPORT--VITI-2015--AUTOMATIKE--MOTORR-3-0-NAFTE.jpeg?noLogo=true",
      ],
      plate: Plate(id: 0, name: 'test'),
      color: Color(id: 0, name: 'red', code: '#WQESAD1'),
      location: Location(id: 0, name: 'test'),
      manufacturer: Manufacturer(id: 0, name: 'Renault'),
      model: Model(id: 0, name: 'Megan Scenic'),
      price: Price(value: 2000, valute: Valute.euro()),
      isFavorite: false,
    ),
    Listing(
      id: 4,
      type: VehicleType(id: 0, name: 'SUV'),
      transmission: Transmission(id: 0, type: 'test'),
      year: 2001,
      mileage: 100000,
      fuels: [
        Fuel(id: 0, type: 'test'),
      ],
      urls: [
        "https://media.merrjep.al/Image/571684d2ac2c49199929127601bf9667/20210417/false/false/1280/960/RANGE-ROVER-SPORT--VITI-2015--AUTOMATIKE--MOTORR-3-0-NAFTE.jpeg?noLogo=true",
        "https://media.merrjep.al/Image/b5680d074c384ec6bce46dd927548d86/20210417/false/false/1280/960/RANGE-ROVER-SPORT--VITI-2015--AUTOMATIKE--MOTORR-3-0-NAFTE.jpeg?noLogo=true",
        "https://media.merrjep.al/Image/c49d82e1e1664df7994d1e8b14a8b0e5/20210417/false/false/1280/960/RANGE-ROVER-SPORT--VITI-2015--AUTOMATIKE--MOTORR-3-0-NAFTE.jpeg?noLogo=true",
      ],
      plate: Plate(id: 0, name: 'test'),
      color: Color(id: 0, name: 'red', code: '#WQESAD1'),
      location: Location(id: 0, name: 'test'),
      manufacturer: Manufacturer(id: 0, name: 'Renault'),
      model: Model(id: 0, name: 'Megan Scenic'),
      price: Price(value: 2000, valute: Valute.euro()),
      isFavorite: false,
    ),
    Listing(
      id: 5,
      type: VehicleType(id: 0, name: 'SUV'),
      transmission: Transmission(id: 0, type: 'test'),
      year: 2001,
      mileage: 100000,
      fuels: [
        Fuel(id: 0, type: 'test'),
      ],
      urls: [
        "https://media.merrjep.al/Image/571684d2ac2c49199929127601bf9667/20210417/false/false/1280/960/RANGE-ROVER-SPORT--VITI-2015--AUTOMATIKE--MOTORR-3-0-NAFTE.jpeg?noLogo=true",
        "https://media.merrjep.al/Image/b5680d074c384ec6bce46dd927548d86/20210417/false/false/1280/960/RANGE-ROVER-SPORT--VITI-2015--AUTOMATIKE--MOTORR-3-0-NAFTE.jpeg?noLogo=true",
        "https://media.merrjep.al/Image/c49d82e1e1664df7994d1e8b14a8b0e5/20210417/false/false/1280/960/RANGE-ROVER-SPORT--VITI-2015--AUTOMATIKE--MOTORR-3-0-NAFTE.jpeg?noLogo=true",
      ],
      plate: Plate(id: 0, name: 'test'),
      color: Color(id: 0, name: 'red', code: '#WQESAD1'),
      location: Location(id: 0, name: 'test'),
      manufacturer: Manufacturer(id: 0, name: 'Renault'),
      model: Model(id: 0, name: 'Megan Scenic'),
      price: Price(value: 2000, valute: Valute.euro()),
      isFavorite: false,
    ),
    Listing(
      id: 6,
      type: VehicleType(id: 0, name: 'SUV'),
      transmission: Transmission(id: 0, type: 'test'),
      year: 2001,
      mileage: 100000,
      fuels: [
        Fuel(id: 0, type: 'test'),
      ],
      urls: [
        "https://media.merrjep.al/Image/571684d2ac2c49199929127601bf9667/20210417/false/false/1280/960/RANGE-ROVER-SPORT--VITI-2015--AUTOMATIKE--MOTORR-3-0-NAFTE.jpeg?noLogo=true",
        "https://media.merrjep.al/Image/b5680d074c384ec6bce46dd927548d86/20210417/false/false/1280/960/RANGE-ROVER-SPORT--VITI-2015--AUTOMATIKE--MOTORR-3-0-NAFTE.jpeg?noLogo=true",
        "https://media.merrjep.al/Image/c49d82e1e1664df7994d1e8b14a8b0e5/20210417/false/false/1280/960/RANGE-ROVER-SPORT--VITI-2015--AUTOMATIKE--MOTORR-3-0-NAFTE.jpeg?noLogo=true",
      ],
      plate: Plate(id: 0, name: 'test'),
      color: Color(id: 0, name: 'red', code: '#WQESAD1'),
      location: Location(id: 0, name: 'test'),
      manufacturer: Manufacturer(id: 0, name: 'Renault'),
      model: Model(id: 0, name: 'Megan Scenic'),
      price: Price(value: 2000, valute: Valute.euro()),
      isFavorite: false,
    ),
    Listing(
      id: 7,
      type: VehicleType(id: 0, name: 'SUV'),
      transmission: Transmission(id: 0, type: 'test'),
      year: 2001,
      mileage: 100000,
      fuels: [
        Fuel(id: 0, type: 'test'),
      ],
      urls: [
        "https://media.merrjep.al/Image/571684d2ac2c49199929127601bf9667/20210417/false/false/1280/960/RANGE-ROVER-SPORT--VITI-2015--AUTOMATIKE--MOTORR-3-0-NAFTE.jpeg?noLogo=true",
        "https://media.merrjep.al/Image/b5680d074c384ec6bce46dd927548d86/20210417/false/false/1280/960/RANGE-ROVER-SPORT--VITI-2015--AUTOMATIKE--MOTORR-3-0-NAFTE.jpeg?noLogo=true",
        "https://media.merrjep.al/Image/c49d82e1e1664df7994d1e8b14a8b0e5/20210417/false/false/1280/960/RANGE-ROVER-SPORT--VITI-2015--AUTOMATIKE--MOTORR-3-0-NAFTE.jpeg?noLogo=true",
      ],
      plate: Plate(id: 0, name: 'test'),
      color: Color(id: 0, name: 'red', code: '#WQESAD1'),
      location: Location(id: 0, name: 'test'),
      manufacturer: Manufacturer(id: 0, name: 'Renault'),
      model: Model(id: 0, name: 'Megan Scenic'),
      price: Price(value: 2000, valute: Valute.euro()),
      isFavorite: false,
    ),
    Listing(
      id: 8,
      type: VehicleType(id: 0, name: 'SUV'),
      transmission: Transmission(id: 0, type: 'test'),
      year: 2001,
      mileage: 100000,
      fuels: [
        Fuel(id: 0, type: 'test'),
      ],
      urls: [
        "https://media.merrjep.al/Image/571684d2ac2c49199929127601bf9667/20210417/false/false/1280/960/RANGE-ROVER-SPORT--VITI-2015--AUTOMATIKE--MOTORR-3-0-NAFTE.jpeg?noLogo=true",
        "https://media.merrjep.al/Image/b5680d074c384ec6bce46dd927548d86/20210417/false/false/1280/960/RANGE-ROVER-SPORT--VITI-2015--AUTOMATIKE--MOTORR-3-0-NAFTE.jpeg?noLogo=true",
        "https://media.merrjep.al/Image/c49d82e1e1664df7994d1e8b14a8b0e5/20210417/false/false/1280/960/RANGE-ROVER-SPORT--VITI-2015--AUTOMATIKE--MOTORR-3-0-NAFTE.jpeg?noLogo=true",
      ],
      plate: Plate(id: 0, name: 'test'),
      color: Color(id: 0, name: 'red', code: '#WQESAD1'),
      location: Location(id: 0, name: 'test'),
      manufacturer: Manufacturer(id: 0, name: 'Renault'),
      model: Model(id: 0, name: 'Megan Scenic'),
      price: Price(value: 2000, valute: Valute.euro()),
      isFavorite: false,
    ),
    Listing(
      id: 9,
      type: VehicleType(id: 0, name: 'SUV'),
      transmission: Transmission(id: 0, type: 'test'),
      year: 2001,
      mileage: 100000,
      fuels: [
        Fuel(id: 0, type: 'test'),
      ],
      urls: [
        "https://media.merrjep.al/Image/571684d2ac2c49199929127601bf9667/20210417/false/false/1280/960/RANGE-ROVER-SPORT--VITI-2015--AUTOMATIKE--MOTORR-3-0-NAFTE.jpeg?noLogo=true",
        "https://media.merrjep.al/Image/b5680d074c384ec6bce46dd927548d86/20210417/false/false/1280/960/RANGE-ROVER-SPORT--VITI-2015--AUTOMATIKE--MOTORR-3-0-NAFTE.jpeg?noLogo=true",
        "https://media.merrjep.al/Image/c49d82e1e1664df7994d1e8b14a8b0e5/20210417/false/false/1280/960/RANGE-ROVER-SPORT--VITI-2015--AUTOMATIKE--MOTORR-3-0-NAFTE.jpeg?noLogo=true",
      ],
      plate: Plate(id: 0, name: 'test'),
      color: Color(id: 0, name: 'red', code: '#WQESAD1'),
      location: Location(id: 0, name: 'test'),
      manufacturer: Manufacturer(id: 0, name: 'Renault'),
      model: Model(id: 0, name: 'Megan Scenic'),
      price: Price(value: 2000, valute: Valute.euro()),
      isFavorite: false,
    ),
    Listing(
      id: 10,
      type: VehicleType(id: 0, name: 'SUV'),
      transmission: Transmission(id: 0, type: 'test'),
      year: 2001,
      mileage: 100000,
      fuels: [
        Fuel(id: 0, type: 'test'),
      ],
      urls: [
        "https://media.merrjep.al/Image/571684d2ac2c49199929127601bf9667/20210417/false/false/1280/960/RANGE-ROVER-SPORT--VITI-2015--AUTOMATIKE--MOTORR-3-0-NAFTE.jpeg?noLogo=true",
        "https://media.merrjep.al/Image/b5680d074c384ec6bce46dd927548d86/20210417/false/false/1280/960/RANGE-ROVER-SPORT--VITI-2015--AUTOMATIKE--MOTORR-3-0-NAFTE.jpeg?noLogo=true",
        "https://media.merrjep.al/Image/c49d82e1e1664df7994d1e8b14a8b0e5/20210417/false/false/1280/960/RANGE-ROVER-SPORT--VITI-2015--AUTOMATIKE--MOTORR-3-0-NAFTE.jpeg?noLogo=true",
      ],
      plate: Plate(id: 0, name: 'test'),
      color: Color(id: 0, name: 'red', code: '#WQESAD1'),
      location: Location(id: 0, name: 'test'),
      manufacturer: Manufacturer(id: 0, name: 'Renault'),
      model: Model(id: 0, name: 'Megan Scenic'),
      price: Price(value: 2000, valute: Valute.euro()),
      isFavorite: false,
    ),
    Listing(
      id: 11,
      type: VehicleType(id: 0, name: 'SUV'),
      transmission: Transmission(id: 0, type: 'test'),
      year: 2001,
      mileage: 100000,
      fuels: [
        Fuel(id: 0, type: 'test'),
      ],
      urls: [
        "https://media.merrjep.al/Image/571684d2ac2c49199929127601bf9667/20210417/false/false/1280/960/RANGE-ROVER-SPORT--VITI-2015--AUTOMATIKE--MOTORR-3-0-NAFTE.jpeg?noLogo=true",
        "https://media.merrjep.al/Image/b5680d074c384ec6bce46dd927548d86/20210417/false/false/1280/960/RANGE-ROVER-SPORT--VITI-2015--AUTOMATIKE--MOTORR-3-0-NAFTE.jpeg?noLogo=true",
        "https://media.merrjep.al/Image/c49d82e1e1664df7994d1e8b14a8b0e5/20210417/false/false/1280/960/RANGE-ROVER-SPORT--VITI-2015--AUTOMATIKE--MOTORR-3-0-NAFTE.jpeg?noLogo=true",
      ],
      plate: Plate(id: 0, name: 'test'),
      color: Color(id: 0, name: 'red', code: '#WQESAD1'),
      location: Location(id: 0, name: 'test'),
      manufacturer: Manufacturer(id: 0, name: 'Renault'),
      model: Model(id: 0, name: 'Megan Scenic'),
      price: Price(value: 2000, valute: Valute.euro()),
      isFavorite: false,
    ),
    Listing(
      id: 12,
      type: VehicleType(id: 0, name: 'SUV'),
      transmission: Transmission(id: 0, type: 'test'),
      year: 2001,
      mileage: 100000,
      fuels: [
        Fuel(id: 0, type: 'test'),
      ],
      urls: [
        "https://media.merrjep.al/Image/571684d2ac2c49199929127601bf9667/20210417/false/false/1280/960/RANGE-ROVER-SPORT--VITI-2015--AUTOMATIKE--MOTORR-3-0-NAFTE.jpeg?noLogo=true",
        "https://media.merrjep.al/Image/b5680d074c384ec6bce46dd927548d86/20210417/false/false/1280/960/RANGE-ROVER-SPORT--VITI-2015--AUTOMATIKE--MOTORR-3-0-NAFTE.jpeg?noLogo=true",
        "https://media.merrjep.al/Image/c49d82e1e1664df7994d1e8b14a8b0e5/20210417/false/false/1280/960/RANGE-ROVER-SPORT--VITI-2015--AUTOMATIKE--MOTORR-3-0-NAFTE.jpeg?noLogo=true",
      ],
      plate: Plate(id: 0, name: 'test'),
      color: Color(id: 0, name: 'red', code: '#WQESAD1'),
      location: Location(id: 0, name: 'test'),
      manufacturer: Manufacturer(id: 0, name: 'Renault'),
      model: Model(id: 0, name: 'Megan Scenic'),
      price: Price(value: 2000, valute: Valute.euro()),
      isFavorite: false,
    ),
    Listing(
      id: 13,
      type: VehicleType(id: 0, name: 'SUV'),
      transmission: Transmission(id: 0, type: 'test'),
      year: 2001,
      mileage: 1000000,
      fuels: [
        Fuel(id: 0, type: 'test'),
      ],
      urls: [
        "https://media.merrjep.al/Image/571684d2ac2c49199929127601bf9667/20210417/false/false/1280/960/RANGE-ROVER-SPORT--VITI-2015--AUTOMATIKE--MOTORR-3-0-NAFTE.jpeg?noLogo=true",
        "https://media.merrjep.al/Image/b5680d074c384ec6bce46dd927548d86/20210417/false/false/1280/960/RANGE-ROVER-SPORT--VITI-2015--AUTOMATIKE--MOTORR-3-0-NAFTE.jpeg?noLogo=true",
        "https://media.merrjep.al/Image/c49d82e1e1664df7994d1e8b14a8b0e5/20210417/false/false/1280/960/RANGE-ROVER-SPORT--VITI-2015--AUTOMATIKE--MOTORR-3-0-NAFTE.jpeg?noLogo=true",
      ],
      plate: Plate(id: 0, name: 'test'),
      color: Color(id: 0, name: 'red', code: '#WQESAD1'),
      location: Location(id: 0, name: 'test'),
      manufacturer: Manufacturer(id: 0, name: 'Renault'),
      model: Model(id: 0, name: 'Megan Scenic'),
      price: Price(value: 2000, valute: Valute.euro()),
      isFavorite: false,
    ),
  ];

  Future<List<Listing>> fetchListings(int startIndex, int limit) async {
    return startIndex < 40 ? _listings : [];
  }
}

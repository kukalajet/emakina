import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:emakina/app.dart';
import 'package:emakina/blocs/simple_bloc_observer.dart';
import 'package:listing_repository/listing_repository.dart';
import 'package:favorite_repository/favorite_repository.dart';
import 'package:location_repository/location_repository.dart';
import 'package:manufacturer_repository/manufacturer_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:valute_repository/valute_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  EquatableConfig.stringify = kDebugMode;

  Bloc.observer = SimpleBlocObserver();

  final client = http.Client();
  final storage = FlutterSecureStorage();
  final sharedPrefs = await SharedPreferences.getInstance();

  runApp(App(
    listingRepository: ListingRepository(httpClient: client),
    favoriteRepository: FavoriteRepository(sharedPrefs: sharedPrefs),
    valuteRepository: ValuteRepository(httpClient: client),
    locationRepository: LocationRepository(httpClient: client),
    manufacturerRepository: ManufacturerRepository(httpClient: client),
  ));
}

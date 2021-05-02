import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:listing_repository/listing_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteRepository {
  const FavoriteRepository({
    @required this.sharedPrefs,
  });

  static const _keyFavoriteRepository = "FAVORITE_REPOSITORY";

  final SharedPreferences sharedPrefs;

  Future<void> save(int favoriteId) async {
    final saved = await this.getFavoriteIds();
    saved.add(favoriteId);
    sharedPrefs.setString(
      _keyFavoriteRepository,
      saved.toString(),
    );
  }

  Future<void> remove(int favoriteId) async {
    final saved = await this.getFavoriteIds();
    saved.removeWhere((id) => id == favoriteId);
    sharedPrefs.setString(
      _keyFavoriteRepository,
      saved.toString(),
    );
  }

  // TODO: Implement mulltiple item API call.
  // i.e. A post call to which we pass an array of ids.
  Future<List<Listing>> fetchFavorites() async {
    // getAllIds
    // final ids = this.getFavoriteIds();
    // fetch all listings for ids
    // return
    return [];
  }

  // TODO: Implement single item API call.
  Future<Listing> fetchFavorite(int id) async {
    return null;
  }

  Future<List<dynamic>> getFavoriteIds() async {
    final value = sharedPrefs.getString(_keyFavoriteRepository) ?? '[]';
    final saved = jsonDecode(value);
    return saved;
  }
}

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

  Future<void> save(Listing favorite) async {
    final saved = await this.getAll();
    saved.add(favorite);
    sharedPrefs.setString(
      _keyFavoriteRepository,
      saved.toString(),
    );
  }

  Future<List<Listing>> getAll() async {
    final value = sharedPrefs.getString(_keyFavoriteRepository) ?? '[]';
    final decoded = jsonDecode(value) as List;
    final List<Listing> saved =
        decoded.map((favorite) => Listing.fromJson(favorite)).toList();

    return saved;
  }
}

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:color_repository/src/models/models.dart';

class ColorRepository {
  const ColorRepository({@required this.httpClient});

  final http.Client httpClient;

  /// TODO: Colors should be retrieved from shared prefs, if nothing is there, we should ask the BE.
  Future<List<Color>> fetchColors() async {
    List<Color> fuels = <Color>[
      Color(id: 0, name: 'IndianRed', code: '#CD5C5C'),
      Color(id: 0, name: 'LightCoral', code: '#F08080'),
      Color(id: 0, name: 'Salmon', code: '#FA8072'),
    ];

    return fuels;
  }
}

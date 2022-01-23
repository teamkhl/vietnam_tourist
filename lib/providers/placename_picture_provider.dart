import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:vietnam_tourist/providers/server_url.dart';

import '../models/image.dart';

class PlacenamePictureProvider with ChangeNotifier {
  Future<List<Picture>> fetchAndSetPlacenamePictures(String id) async {
    try {
      final response =
          await http.get(Uri.parse(serverUrl() + 'api/placename-image/$id'));
      final extractedData = json.decode(response.body);

      if (extractedData == null) {
        return <Picture>[];
      }
      notifyListeners();
      return extractedData
          .map<Picture>((json) => Picture.fromJson(json))
          .toList();
    } catch (error) {
      print(error);
      throw error;
    }
  }
}

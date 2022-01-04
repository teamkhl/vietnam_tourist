import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/placename.dart';

class PlacenameProvider with ChangeNotifier {
  List<Placename> _placenames = [];

  List<Placename> get placenames {
    return [..._placenames];
  }

  Future<Placename?> fetchAndSetPlacenames() async {
    try {
      final response =
          await http.get(Uri.parse('http://127.0.0.1:8000/api/placename'));
      final extractedData = json.decode(response.body);

      if (extractedData == null) {
        return null;
      }
      _placenames = extractedData
          .map<Placename>((json) => Placename.fromJson(json))
          .toList();

      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }

  Future<Placename> fetchAndSetPlacename(String id) async {
    try {
      final response =
          await http.get(Uri.parse('http://127.0.0.1:8000/api/placename/$id'));
      final extractedData = json.decode(response.body);

      if (extractedData == null) {
        return Placename();
      }
      notifyListeners();
      return Placename.fromJson(extractedData);
    } catch (error) {
      print(error);
      throw error;
    }
  }
}

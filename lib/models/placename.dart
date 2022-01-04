import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

Future<List<Placename>> fetchPlacenames() async {
  final response =
      await http.get(Uri.parse('http://127.0.0.1:8000/api/placename'));

  if (response.statusCode == 200) {
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

    return parsed.map<Placename>((json) => Placename.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load album');
  }
}

class Placename {
  int? id;
  String? name;
  Map<String, double> coordinates = {'latitude': 0.0, 'longitude': 0.0};
  String? description;
  String? specialties;

  Placename({id, name, description, coordinates});

  Placename.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    coordinates['latitude'] = json["latitude"];
    coordinates['longitude'] = json["longitude"];
    description = json["description"];
    specialties = json["specialties"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data["id"] = id;
    data["name"] = name;
    data["latitude"] = coordinates['latitude'];
    data["longitude"] = coordinates['longitude'];
    data["description"] = description;
    data["specialties"] = specialties;
    return data;
  }
}

import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:vietnam_tourist/providers/server_url.dart';

Future<Placename> fetchPlacename(String id) async {
  final response = await http.get(Uri.parse(serverUrl() + 'api/placename/$id'));

  if (response.statusCode == 200) {
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

    return Placename.fromJson(parsed);
  } else {
    throw Exception('Failed to load album');
  }
}

class Placename {
  int? id;
  String? name = "";
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

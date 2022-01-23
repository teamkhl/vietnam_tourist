import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:vietnam_tourist/models/placename.dart';
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

class Post {
  int? id;
  int? userId;
  int? placenameId;
  Placename? placename;
  String? createdAt;
  String? content;

  Post({this.id, this.userId, this.placenameId, this.content, this.createdAt});

  Post.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.userId = json["userId"];
    this.placenameId = json["placenameId"];
    // this.placename = fetchPlacename(json["placenameId"]) as Placename;
    // //  Placename();

    this.createdAt = json["created_at"];
    this.content = json["content"];
    // log(fetchPlacename(json["placenameId"]).toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["userId"] = this.userId;
    data["placenameId"] = this.placenameId;
    data["created_at"] = this.createdAt;
    data["content"] = this.content;
    return data;
  }
}

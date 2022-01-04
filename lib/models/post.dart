import 'dart:convert';

import 'package:http/http.dart' as http;

class Post {
  int? id;
  int? userId;
  int? placenameId;
  String? createdAt;
  String? content;

  Post({this.id, this.userId, this.placenameId, this.content, this.createdAt});

  Post.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.userId = json["userId"];
    this.placenameId = json["placenameId"];
    this.createdAt = json["created_at"];
    this.content = json["content"];
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

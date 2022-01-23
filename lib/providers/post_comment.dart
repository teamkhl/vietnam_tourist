import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:vietnam_tourist/models/comment.dart';
import 'package:vietnam_tourist/providers/server_url.dart';

import '../models/image.dart';

class PostCommentProvider with ChangeNotifier {
  Future<List<Comment>> fetchAndSetPostComments(String id) async {
    try {
      final response =
          await http.get(Uri.parse(serverUrl() + 'api/post-comment/$id'));
      final extractedData = json.decode(response.body);

      if (extractedData == null) {
        return <Comment>[];
      }
      notifyListeners();
      return extractedData
          .map<Comment>((json) => Comment.fromJson(json))
          .toList();
    } catch (error) {
      print(error);
      throw error;
    }
  }
}

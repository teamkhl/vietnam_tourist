import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/post.dart';

class PostProvider with ChangeNotifier {
  List<Post> _posts = [];

  List<Post> get posts {
    return [..._posts];
  }

  Future<Post?> fetchAndSetPosts() async {
    try {
      final response =
          await http.get(Uri.parse('http://127.0.0.1:8000/api/post'));
      final extractedData = json.decode(response.body);

      if (extractedData == null) {
        return null;
      }
      _posts = extractedData.map<Post>((json) => Post.fromJson(json)).toList();

      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }
}

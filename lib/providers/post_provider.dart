import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:vietnam_tourist/providers/server_url.dart';

import '../models/post.dart';

class PostProvider with ChangeNotifier {
  List<Post> _posts = [];

  List<Post> get posts {
    return [..._posts];
  }

  Future<Post?> fetchAndSetPosts() async {
    try {
      final response = await http.get(Uri.parse(serverUrl() + 'api/post'));
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

  Future createPost(Post post) async {
    final response = await http.post(
      Uri.parse(serverUrl() + 'api/post'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: post.toJson(),
    );

    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      log(jsonDecode(response.body));
      return jsonDecode(response.body);
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create post.');
    }
  }
}

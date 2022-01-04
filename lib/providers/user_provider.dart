import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/user.dart';

class UserProvider with ChangeNotifier {
  List<User> _users = [];

  List<User> get users {
    return [..._users];
  }

  Future<User?> fetchAndSetUsers() async {
    try {
      final response =
          await http.get(Uri.parse('http://127.0.0.1:8000/api/user'));
      final extractedData = json.decode(response.body);

      if (extractedData == null) {
        return null;
      }
      _users = extractedData.map<User>((json) => User.fromJson(json)).toList();

      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }

  Future<User> fetchAndSetUser(String id) async {
    try {
      final response =
          await http.get(Uri.parse('http://127.0.0.1:8000/api/user/$id'));
      final extractedData = json.decode(response.body);

      if (extractedData == null) {
        return User();
      }
      return User.fromJson(extractedData);

      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }
}

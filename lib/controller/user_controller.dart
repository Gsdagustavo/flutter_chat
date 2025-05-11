import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/user.dart';

class UserController {
  static Future<List<User>> getUsers(String url) async {
    final List<User> users = [];

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final resp = jsonDecode(response.body);

      for (final userJson in resp) {
        final user = User.fromJson(userJson);
        users.add(user);
      }
    }

    return users;
  }
}
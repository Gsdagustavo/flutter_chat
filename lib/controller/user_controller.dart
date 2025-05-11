import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/user.dart';

class UserController {
  static Future<List<User>> getUsers(String url) async {
    final List<User> users = [];

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List<dynamic> resp = jsonDecode(response.body);

      for (final userJson in resp) {

        if (userJson is Map<String, dynamic>) {
          final user = User.fromJson(userJson);
          users.add(user);
        }
        else {
          throw Exception('formato invalido de usuario');
        }
      }
    }

    return users;
  }
}

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_chat/core/constants/urls.dart';
import 'package:http/http.dart' as http;

import '../models/user.dart';

class UserProvider with ChangeNotifier {
  final List<User> _users = [];

  bool _isLoading = false;

  List<User> get users => _users;

  bool get isLoading => _isLoading;

  UserProvider() {
    loadUsers();
  }

  Future<void> loadUsers() async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await http.get(Uri.parse(usersUrl));

      if (response.statusCode == 200) {
        final List<dynamic> resp = jsonDecode(response.body);

        /// iterates through all users in the [response.body]
        for (final userJson in resp) {
          if (userJson is Map<String, dynamic>) {
            final user = User.fromJson(userJson);
            _users.add(user);
          } else {
            throw Exception('Invalid user format');
          }
        }
      } else {
        throw Exception('An error occurred while trying to load users');
      }
    } catch (e) {
      debugPrint('Error: $e');
    }

    _isLoading = false;
    notifyListeners();
  }
}

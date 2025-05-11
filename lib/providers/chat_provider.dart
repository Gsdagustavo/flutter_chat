import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_chat/core/constants/urls.dart';
import 'package:flutter_chat/models/chat.dart';
import 'package:http/http.dart' as http;

class ChatProvider with ChangeNotifier {
  final List<Chat> _chats = [];

  bool _isLoading = false;

  ChatProvider() {
    loadChats();
  }

  Future<void> loadChats() async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await http.get(Uri.parse(chatsUrl));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as List<dynamic>;

        for (final chat in data) {
          _chats.add(Chat.fromJson(chat));
        }

      } else {
        throw Exception('An error occurred while trying to load users');
      }
    } catch (e) {
      print('Error: $e');
    }

    _isLoading = false;
    notifyListeners();
  }
}

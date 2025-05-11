import 'package:flutter/material.dart';
import 'package:flutter_chat/views/home_page.dart';

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat',
      debugShowCheckedModeBanner: false,

      routes: {'/': (_) => HomePage()},
    );
  }
}

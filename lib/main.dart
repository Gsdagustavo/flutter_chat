import 'package:flutter/material.dart';
import 'package:flutter_chat/providers/user_provider.dart';
import 'package:provider/provider.dart';

import 'app.dart';

void main() {
  runApp(
    /// providers
    MultiProvider(
      providers: [
        /// user provider
        ChangeNotifierProvider(create: (context) => UserProvider()),
      ],

      child: const ChatApp(),
    ),
  );
}

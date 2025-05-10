import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat',
      debugShowCheckedModeBanner: false,

      routes: {
        '/':(_) => const HomePage()
      }
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Hello World!')
      )
    );
  }
}

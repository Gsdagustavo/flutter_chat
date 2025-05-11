import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_chat/controller/user_controller.dart';

const String getUsersUrl = 'http://localhost:3000/users';

void main() async {
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
      body: Column(
        children: [

          Expanded(
            child: FutureBuilder(
              future: UserController.getUsers(getUsersUrl),
              builder: (context, snapshot) {
                if (snapshot.hasError || !snapshot.hasData) {
                  return Container(color: Colors.red);
                }

                final users = snapshot.data!;

                return ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    final user = users[index];

                    return ListTile(
                      leading: Image.network(user.image),
                      title: Text(user.name),
                      subtitle: Text(user.id),
                      horizontalTitleGap: 10,
                      tileColor: Colors.yellow.shade400,
                    );
                  }
                );
              }
            )
          )
        ]
      )
    );
  }
}

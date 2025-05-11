import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_chat/controller/user_controller.dart';

const String getUsersUrl = 'http://localhost:3000/users';

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
        '/':(_) => HomePage()
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
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: FutureBuilder(
                future: UserController.getUsers(getUsersUrl),
                builder: (context, snapshot) {

                  /// loading
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }

                  /// error
                  if (snapshot.hasError) {
                    return Container(color: Colors.red, child: Text('Erro: ${snapshot.error}'));
                  }

                  /// no data
                  if (!snapshot.hasData) {
                    return Center(child: Text('Nenhum dado encontrado', style: TextStyle(fontSize: 20)));
                  }

                  final users = snapshot.data!;

                  return ListView.separated(
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 10);
                    },
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      final user = users[index];

                      return ListTile(
                        leading: Image.network(user.profileImage),
                        title: Text(user.name),

                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(user.id.toString())
                          ]
                        )
                      );
                    }
                  );
                }
              )
            )
          )
        ]
      )
    );
  }
}

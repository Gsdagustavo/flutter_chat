import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'model/user.dart';

const String getUsersUrl = 'http://localhost:3000/users';



Future<List<User>> getUsers() async {
  final List<User> users = [];

  final response = await http.get(Uri.parse(getUsersUrl));

  if (response.statusCode == 200) {
    final resp = jsonDecode(response.body);

    for (final userJson in resp) {
      final user = User.fromJson(userJson);
      users.add(user);
    }
  }

  return users;
}

void main() async {
  await getUsers();
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
              future: getUsers(), 
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

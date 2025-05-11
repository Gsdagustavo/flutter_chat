import 'package:flutter/material.dart';
import 'package:flutter_chat/providers/user_provider.dart';
import 'package:flutter_chat/widgets/user_list.dart';
import 'package:provider/provider.dart';

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
              child: const UserList(),
            ),
          ),
        ],
      ),
    );
  }
}

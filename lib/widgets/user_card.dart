import 'package:flutter/material.dart';

import '../models/user.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),

      margin: EdgeInsets.all(10),

      child: Padding(
        padding: EdgeInsets.all(16),

        child: Row(
          children: [

            /// user image
            CircleAvatar(
              radius: 15,
              child: Image.network(user.profileImage),
            ),

            const SizedBox(width: 20),

            /// name and id
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text(user.name), Text(user.id.toString())],
            ),
          ],
        ),
      ),
    );
  }
}

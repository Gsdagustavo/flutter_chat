import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/user_provider.dart';

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, userProvider, child) {
        if (userProvider.isLoading) {
          return Center(child: CircularProgressIndicator());
        }

        /// gets the list of users
        final users = userProvider.users;

        return ListView.separated(
          /// separator
          separatorBuilder: (context, index) {
            return const SizedBox(height: 10);
          },

          itemCount: users.length,

          itemBuilder: (context, index) {
            final user = users[index];

            /// listtile containing all users
            return ListTile(
              leading: Image.network(
                user.profileImage,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const CircularProgressIndicator();
                },
              ),

              /// user name
              title: Text(user.name),

              /// user id
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [Text(user.id.toString())],
              ),
            );
          },
        );
      },
    );
  }
}

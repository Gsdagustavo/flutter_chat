import 'package:flutter/material.dart';
import 'package:flutter_chat/providers/user_provider.dart';
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

              /// consumer to keep track when the UserProvider notifies any change
              child: Consumer<UserProvider>(
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}

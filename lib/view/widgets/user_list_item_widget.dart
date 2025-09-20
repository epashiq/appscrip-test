


import 'package:appscrip_test/controller/providers/user_provider.dart';
import 'package:appscrip_test/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserListItemWidget extends StatelessWidget {
  final UserModel user;
  final VoidCallback onTap;

  const UserListItemWidget({
    super.key,
    required this.user,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      elevation: 2,
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: CircleAvatar(
          backgroundColor: Colors.black,
          child: Text(
            user.name.split(' ').map((n) => n[0]).take(2).join(),
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Text(
          user.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.email, size: 16, color: Colors.grey),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    user.email,
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.business, size: 16, color: Colors.grey),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    user.company.name,
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ),
              ],
            ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(
                user.isFavourite ? Icons.favorite : Icons.favorite_border,
                color: user.isFavourite ? Colors.red : Colors.grey,
              ),
              onPressed: () {
                Provider.of<UserProvider>(context, listen: false)
                    .toggleFavorite(user);
              },
            ),
            const Icon(Icons.arrow_forward_ios),
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}

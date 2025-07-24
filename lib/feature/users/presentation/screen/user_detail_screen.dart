import 'package:flutter/material.dart';

class UserDetailScreen extends StatelessWidget {
  const UserDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    // Mock user data
    final user = {
      'id': 1,
      'email': 'john@mail.com',
      'name': 'Jhon',
      'role': 'customer',
      'avatar': 'https://i.imgur.com/LDOO4Qs.jpg',
    };

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'User Detail',
          style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 48,
              backgroundImage: NetworkImage(user['avatar'].toString()),
            ),
            const SizedBox(height: 24),
            Text(
              user['name'].toString(),
              style: textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(user['email'].toString(), style: textTheme.titleMedium),
            const SizedBox(height: 8),
            Chip(
              label: Text(user['role'].toString()),
              backgroundColor: colorScheme.primary.withOpacity(0.1),
              labelStyle: textTheme.bodyMedium?.copyWith(
                color: colorScheme.primary,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'User ID: ${user['id']}',
              style: textTheme.bodySmall?.copyWith(color: colorScheme.outline),
            ),
          ],
        ),
      ),
    );
  }
}

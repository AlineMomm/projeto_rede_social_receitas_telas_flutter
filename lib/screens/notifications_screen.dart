import 'package:flutter/material.dart';
import '../data/mock_data.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notificações')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: notificationsMock.length,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (_, i) => ListTile(
          leading: const Icon(Icons.notifications_outlined),
          title: Text(notificationsMock[i]),
          trailing: const Text('agora'),
        ),
      ),
    );
  }
}

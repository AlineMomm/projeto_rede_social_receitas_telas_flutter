import 'package:flutter/material.dart';
import '../data/mock_data.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nameCtrl = TextEditingController(text: currentUser.name);
    final bioCtrl = TextEditingController(text: currentUser.bio);

    return Scaffold(
      appBar: AppBar(title: const Text('Editar perfil')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Center(
            child: Stack(
              children: [
                CircleAvatar(radius: 48, backgroundImage: AssetImage(currentUser.avatarAsset)),
                Positioned(
                  bottom: 0, right: 0,
                  child: CircleAvatar(
                    radius: 16,
                    child: IconButton(onPressed: () {}, icon: const Icon(Icons.edit, size: 16)),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          TextField(decoration: const InputDecoration(labelText: 'Nome'), controller: nameCtrl),
          const SizedBox(height: 12),
          TextField(decoration: const InputDecoration(labelText: 'Bio'), controller: bioCtrl, maxLines: 2),
          const SizedBox(height: 24),
          FilledButton(onPressed: () {}, child: const Text('Salvar (simulado)')),
        ],
      ),
    );
  }
}

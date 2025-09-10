import 'package:flutter/material.dart';
import '../data/mock_data.dart';
import '../components/recipe_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Perfil')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            children: [
              CircleAvatar(radius: 36, backgroundImage: AssetImage(currentUser.avatarAsset)),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(currentUser.name, style: Theme.of(context).textTheme.titleLarge),
                    Text(currentUser.bio),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        _stat('Receitas', currentUser.recipesCount),
                        const SizedBox(width: 16),
                        _stat('Seguidores', currentUser.followers),
                        const SizedBox(width: 16),
                        _stat('Seguindo', currentUser.following),
                      ],
                    ),
                  ],
                ),
              ),
              FilledButton.icon(onPressed: () {}, icon: const Icon(Icons.edit), label: const Text('Editar')),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(),
          const SizedBox(height: 12),
          ...mockRecipes.map((r) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: RecipeCard(recipe: r, showPreview: false),
              )),
        ],
      ),
    );
  }

  Widget _stat(String label, int value) {
    return Column(
      children: [
        Text('$value', style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(label),
      ],
    );
  }
}

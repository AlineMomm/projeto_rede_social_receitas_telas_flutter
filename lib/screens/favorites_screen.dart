import 'package:flutter/material.dart';
import '../data/mock_data.dart';
import '../components/recipe_card.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Salvos')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: favoritesMock.length,
        itemBuilder: (context, i) => Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: RecipeCard(recipe: favoritesMock[i], showPreview: true),
        ),
      ),
    );
  }
}

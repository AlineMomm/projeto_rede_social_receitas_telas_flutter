import 'package:flutter/material.dart';
import '../widgets/recipe_card.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final recipes = [
      {
        'title': 'Cookies de Chocolate',
        'image': 'assets/images/cookies.jpg',
        'preview': 'Farinha, açúcar, manteiga e gotas de chocolate...',
      },
      {
        'title': 'Torrada com Abacate',
        'image': 'assets/images/avocado.jpg',
        'preview': 'Pão integral, abacate amassado e temperos...',
      },
      {
        'title': 'Macarrão Caseiro',
        'image': 'assets/images/pasta.jpg',
        'preview': 'Massa fresca, molho de tomate e parmesão...',
      },
      {
        'title': 'Salada Colorida',
        'image': 'assets/images/salad.jpg',
        'preview': 'Folhas verdes, tomate, pepino e cenoura...',
      },
      {
        'title': 'Bolo de Aniversário',
        'image': 'assets/images/cake.jpg',
        'preview': 'Camadas de bolo fofinho com recheio cremoso...',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Feed de Receitas'),
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          final recipe = recipes[index];
          return RecipeCard(
            title: recipe['title']!,
            imagePath: recipe['image']!,
            preview: recipe['preview']!,
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../components/ingredient_chip.dart';
import '../components/recipe_card.dart';
import '../data/mock_data.dart';

class SearchFilterScreen extends StatefulWidget {
  const SearchFilterScreen({super.key});

  @override
  State<SearchFilterScreen> createState() => _SearchFilterScreenState();
}

class _SearchFilterScreenState extends State<SearchFilterScreen> {
  final queryCtrl = TextEditingController();
  final selectedIngredients = <String>{};

  List<String> get allIngredients {
    return mockRecipes
        .expand((r) => r.ingredients.map((i) => i.name))
        .toSet()
        .toList()
      ..sort();
  }

  @override
  Widget build(BuildContext context) {
    final results = mockRecipes.where((r) {
      final q = queryCtrl.text.toLowerCase();
      final matchesText = q.isEmpty || r.title.toLowerCase().contains(q) || r.author.toLowerCase().contains(q);
      final matchesIngredients = selectedIngredients.isEmpty ||
          selectedIngredients.every((ing) => r.ingredients.any((i) => i.name == ing));
      return matchesText && matchesIngredients;
    }).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Pesquisar receitas')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: queryCtrl,
              decoration: InputDecoration(
                hintText: 'Buscar por receita ou autor',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: queryCtrl.text.isNotEmpty
                    ? IconButton(icon: const Icon(Icons.clear), onPressed: () { setState(() => queryCtrl.clear()); })
                    : null,
              ),
              onChanged: (_) => setState(() {}),
            ),
          ),
          SizedBox(
            height: 48,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, i) {
                final ing = allIngredients[i];
                final sel = selectedIngredients.contains(ing);
                return IngredientChip(
                  label: ing,
                  selected: sel,
                  onTap: () => setState(() {
                    if (sel) {
                      selectedIngredients.remove(ing);
                    } else {
                      selectedIngredients.add(ing);
                    }
                  }),
                );
              },
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemCount: allIngredients.length,
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: results.length,
              itemBuilder: (_, i) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: RecipeCard(recipe: results[i]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

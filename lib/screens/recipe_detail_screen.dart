import 'package:flutter/material.dart';
import '../data/mock_data.dart';
import '../components/section_title.dart';

class RecipeDetailScreen extends StatelessWidget {
  const RecipeDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final r = mockRecipes.first;
    return Scaffold(
      appBar: AppBar(title: Text(r.title)),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: const Icon(Icons.shopping_cart_outlined),
        label: const Text('Gerar lista de compras'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(r.imageAsset, height: 220, fit: BoxFit.cover),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(Icons.person_outline),
              const SizedBox(width: 8),
              Text(r.author),
              const Spacer(),
              Icon(Icons.timer_outlined, color: Theme.of(context).colorScheme.primary),
              const SizedBox(width: 6),
              Text('${r.prepMinutes} min'),
            ],
          ),
          const SectionTitle('Ingredientes'),
          ...r.ingredients.map((i) => CheckboxListTile(
                value: false,
                onChanged: (_) {},
                dense: true,
                controlAffinity: ListTileControlAffinity.leading,
                title: Text('${i.quantity} — ${i.name}'),
              )),
          const SectionTitle('Modo de Preparo'),
          ...r.steps.asMap().entries.map((e) => ListTile(
                leading: CircleAvatar(child: Text('${e.key + 1}')),
                title: Text(e.value),
              )),
          const SizedBox(height: 24),
          FilledButton.icon(onPressed: () {}, icon: const Icon(Icons.bookmark_border), label: const Text('Salvar')),
        ],
      ),
    );
  }
}

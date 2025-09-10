import 'package:flutter/material.dart';
import '../models/recipe.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;
  final bool showPreview; // mostra ingredientes/passos (resumo)
  const RecipeCard({super.key, required this.recipe, this.showPreview = true});

  @override
  Widget build(BuildContext context) {
    final previewIngredients = recipe.ingredients.take(3).map((i) => '• ${i.quantity} ${i.name}').join('\n');
    final previewSteps = recipe.steps.isNotEmpty ? '1) ${recipe.steps.first}' : '';

    return Card(
      elevation: 0,
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(backgroundImage: AssetImage('assets/images/avatar.png')),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    recipe.author,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                const Icon(Icons.more_horiz),
              ],
            ),
            const SizedBox(height: 8),
            Text(recipe.title, style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w700)),
            const SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(recipe.imageAsset, height: 160, width: double.infinity, fit: BoxFit.cover),
            ),
            if (showPreview) ...[
              const SizedBox(height: 8),
              Text('Ingredientes (preview):', style: Theme.of(context).textTheme.labelLarge),
              Text(previewIngredients),
              if (previewSteps.isNotEmpty) ...[
                const SizedBox(height: 6),
                Text('Modo de preparo (prévia):', style: Theme.of(context).textTheme.labelLarge),
                Text(previewSteps),
              ]
            ],
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.timer_outlined, size: 18, color: Theme.of(context).colorScheme.primary),
                const SizedBox(width: 4),
                Text('${recipe.prepMinutes} min'),
                const Spacer(),
                Icon(Icons.favorite_border),
                const SizedBox(width: 6),
                Text('${recipe.likes}'),
                const SizedBox(width: 12),
                Icon(Icons.mode_comment_outlined),
                const SizedBox(width: 6),
                Text('${recipe.comments}'),
                const Spacer(),
                Icon(recipe.isFavorite ? Icons.bookmark : Icons.bookmark_border),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

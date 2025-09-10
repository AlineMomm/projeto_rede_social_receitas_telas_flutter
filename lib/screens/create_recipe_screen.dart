import 'package:flutter/material.dart';

class CreateRecipeScreen extends StatefulWidget {
  const CreateRecipeScreen({super.key});

  @override
  State<CreateRecipeScreen> createState() => _CreateRecipeScreenState();
}

class _CreateRecipeScreenState extends State<CreateRecipeScreen> {
  final titleCtrl = TextEditingController();
  final descCtrl = TextEditingController();
  final ingredientCtrl = TextEditingController();
  final stepCtrl = TextEditingController();

  final ingredients = <String>[];
  final steps = <String>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Postar Receita')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 160,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Center(child: Text('Adicionar foto (galeria ou câmera)')),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: titleCtrl,
            decoration: const InputDecoration(labelText: 'Título da receita'),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: descCtrl,
            decoration: const InputDecoration(labelText: 'Descrição curta'),
            maxLines: 2,
          ),
          const SizedBox(height: 16),
          Text('Ingredientes', style: Theme.of(context).textTheme.titleMedium),
          Row(
            children: [
              Expanded(child: TextField(controller: ingredientCtrl, decoration: const InputDecoration(hintText: 'Ex: 2 xícaras de farinha'))),
              const SizedBox(width: 8),
              IconButton(
                onPressed: () {
                  if (ingredientCtrl.text.trim().isEmpty) return;
                  setState(() {
                    ingredients.add(ingredientCtrl.text.trim());
                    ingredientCtrl.clear();
                  });
                },
                icon: const Icon(Icons.add),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ...ingredients.map((e) => ListTile(
                dense: true,
                leading: const Icon(Icons.label_important_outline),
                title: Text(e),
              )),
          const SizedBox(height: 16),
          Text('Modo de preparo', style: Theme.of(context).textTheme.titleMedium),
          Row(
            children: [
              Expanded(child: TextField(controller: stepCtrl, decoration: const InputDecoration(hintText: 'Ex: Misture os secos...'))),
              const SizedBox(width: 8),
              IconButton(
                onPressed: () {
                  if (stepCtrl.text.trim().isEmpty) return;
                  setState(() {
                    steps.add(stepCtrl.text.trim());
                    stepCtrl.clear();
                  });
                },
                icon: const Icon(Icons.add),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ...steps.asMap().entries.map((e) => ListTile(
                dense: true,
                leading: CircleAvatar(child: Text('${e.key + 1}')),
                title: Text(e.value),
              )),
          const SizedBox(height: 20),
          FilledButton.icon(onPressed: () {}, icon: const Icon(Icons.send), label: const Text('Publicar (simulado)')),
        ],
      ),
    );
  }
}

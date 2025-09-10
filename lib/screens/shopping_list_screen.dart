import 'package:flutter/material.dart';
import '../data/mock_data.dart';

class ShoppingListScreen extends StatefulWidget {
  const ShoppingListScreen({super.key});

  @override
  State<ShoppingListScreen> createState() => _ShoppingListScreenState();
}

class _ShoppingListScreenState extends State<ShoppingListScreen> {
  late final items = mockRecipes.first.ingredients.map((i) => '${i.quantity} - ${i.name}').toList();
  final checked = <int>{};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista de Compras')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: items.length,
        itemBuilder: (_, i) => CheckboxListTile(
          value: checked.contains(i),
          onChanged: (_) => setState(() {
            if (checked.contains(i)) checked.remove(i); else checked.add(i);
          }),
          title: Text(items[i]),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: FilledButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.share_outlined),
            label: const Text('Compartilhar (simulado)'),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'screens/feed_screen.dart';
import 'screens/recipe_detail_screen.dart';
import 'screens/create_recipe_screen.dart';
import 'screens/search_filter_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/favorites_screen.dart';
import 'screens/notifications_screen.dart';
import 'screens/shopping_list_screen.dart';
import 'screens/edit_profile_screen.dart';
import 'screens/settings_screen.dart';

void main() {   
  runApp(const RecipeSocialApp());
}

class RecipeSocialApp extends StatelessWidget {
  const RecipeSocialApp({super.key});

  @override
  Widget build(BuildContext context) {
    final baseTheme = ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF6A994E)),
      useMaterial3: true,
      textTheme: GoogleFonts.interTextTheme(),
    );

    return MaterialApp(
      title: 'Recipe Social',
      debugShowCheckedModeBanner: false,
      theme: baseTheme,
      // Dica: para testar uma tela específica, comente a HomeMenu e
      // descomente a tela desejada:
      // home: const FeedScreen(),
      home: const HomeMenu(),
    );
  }
}

class HomeMenu extends StatelessWidget {
  const HomeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final items = <Map<String, dynamic>>[
      {'title': '1) Feed', 'widget': const FeedScreen()},
      {'title': '2) Detalhe da Receita', 'widget': const RecipeDetailScreen()},
      {'title': '3) Criar Receita', 'widget': const CreateRecipeScreen()},
      {'title': '4) Pesquisa & Filtro', 'widget': const SearchFilterScreen()},
      {'title': '5) Perfil', 'widget': const ProfileScreen()},
      {'title': '6) Favoritos', 'widget': const FavoritesScreen()},
      {'title': '7) Notificações', 'widget': const NotificationsScreen()},
      {'title': '8) Lista de Compras', 'widget': const ShoppingListScreen()},
      {'title': '9) Editar Perfil', 'widget': const EditProfileScreen()},
      {'title': '10) Configurações', 'widget': const SettingsScreen()},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Recipe Social — Menu de Telas')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: items.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final item = items[index];
          return ListTile(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            tileColor: Theme.of(context).colorScheme.surfaceContainerHighest,
            title: Text(item['title']),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => item['widget'],
            )),
          );
        },
      ),
    );
  }
}

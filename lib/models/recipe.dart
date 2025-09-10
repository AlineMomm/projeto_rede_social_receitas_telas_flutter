import 'package:projeto_rede_social_receitas_telas_flutter/models/ingedient.dart';


class Recipe {
  final String id;
  final String title;
  final String author;
  final String imageAsset;
  final List<Ingredient> ingredients;
  final List<String> steps;
  final int likes;
  final int comments;
  final int prepMinutes;
  final bool isFavorite;

  const Recipe({
    required this.id,
    required this.title,
    required this.author,
    required this.imageAsset,
    required this.ingredients,
    required this.steps,
    required this.likes,
    required this.comments,
    required this.prepMinutes,
    this.isFavorite = false,
  });
}

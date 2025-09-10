import 'package:projeto_rede_social_receitas_telas_flutter/models/ingedient.dart';

import '../models/recipe.dart';
import '../models/user.dart';

const ingredientsPaoDeQueijo = [
  Ingredient(name: 'Polvilho doce', quantity: '2 xícaras'),
  Ingredient(name: 'Queijo meia-cura ralado', quantity: '1 xícara'),
  Ingredient(name: 'Leite', quantity: '1 xícara'),
  Ingredient(name: 'Ovos', quantity: '2 unid.'),
  Ingredient(name: 'Óleo', quantity: '1/4 xícara'),
  Ingredient(name: 'Sal', quantity: 'a gosto'),
];

const ingredientsGuacamole = [
  Ingredient(name: 'Abacate', quantity: '2 unid.'),
  Ingredient(name: 'Cebola roxa', quantity: '1/2 unid.'),
  Ingredient(name: 'Tomate', quantity: '1 unid.'),
  Ingredient(name: 'Coentro', quantity: 'a gosto'),
  Ingredient(name: 'Limão', quantity: '1 unid.'),
  Ingredient(name: 'Sal', quantity: 'a gosto'),
];

const stepsPaoDeQueijo = [
  'Ferver leite com óleo.',
  'Escaldar o polvilho com o líquido quente.',
  'Adicionar queijo, ovos e sal. Misturar até dar ponto.',
  'Modelar bolinhas e assar a 200°C por 25–30 min.',
];

const stepsGuacamole = [
  'Amassar o abacate.',
  'Picar cebola, tomate e coentro.',
  'Misturar tudo com suco de limão e sal.',
];

final mockRecipes = [
  Recipe(
    id: 'r1',
    title: 'Pão de Queijo Mineiro',
    author: 'Ana Clara',
    imageAsset: 'assets/images/recipe_1.png',
    ingredients: ingredientsPaoDeQueijo,
    steps: stepsPaoDeQueijo,
    likes: 235,
    comments: 42,
    prepMinutes: 35,
    isFavorite: true,
  ),
  Recipe(
    id: 'r2',
    title: 'Guacamole Rápida',
    author: 'Carlos Lima',
    imageAsset: 'assets/images/recipe_2.png',
    ingredients: ingredientsGuacamole,
    steps: stepsGuacamole,
    likes: 121,
    comments: 12,
    prepMinutes: 10,
  ),
  Recipe(
    id: 'r3',
    title: 'Salada Colorida',
    author: 'Julia Souza',
    imageAsset: 'assets/images/recipe_3.png',
    ingredients: [
      Ingredient(name: 'Alface', quantity: '4 folhas'),
      Ingredient(name: 'Cenoura', quantity: '1 unid.'),
      Ingredient(name: 'Tomate cereja', quantity: '8 unid.'),
      Ingredient(name: 'Azeite', quantity: '1 colher'),
      Ingredient(name: 'Sal', quantity: 'a gosto'),
    ],
    steps: [
      'Higienizar e cortar os vegetais.',
      'Temperar com azeite e sal.',
    ],
    likes: 89,
    comments: 4,
    prepMinutes: 8,
  ),
];

const currentUser = AppUser(
  id: 'u1',
  name: 'Alan M.',
  avatarAsset: 'assets/images/avatar.png',
  bio: 'Curto receitas rápidas e caseiras.',
  followers: 340,
  following: 180,
  recipesCount: 7,
);

final notificationsMock = [
  'Ana comentou na sua receita Pão de Queijo',
  'Carlos curtiu sua receita Guacamole Rápida',
  'Você atingiu 100 salvamentos!',
];

final favoritesMock = mockRecipes.where((r) => r.isFavorite).toList();

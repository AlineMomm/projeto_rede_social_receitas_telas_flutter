class AppUser {
  final String id;
  final String name;
  final String avatarAsset;
  final String bio;
  final int followers;
  final int following;
  final int recipesCount;

  const AppUser({
    required this.id,
    required this.name,
    required this.avatarAsset,
    required this.bio,
    required this.followers,
    required this.following,
    required this.recipesCount,
  });
}

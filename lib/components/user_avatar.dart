import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  final String imageAsset;
  final double size;
  const UserAvatar({super.key, required this.imageAsset, this.size = 36});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: size / 2,
      backgroundImage: AssetImage(imageAsset),
    );
  }
}

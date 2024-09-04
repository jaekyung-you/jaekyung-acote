import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CircleAvatarWidget extends StatelessWidget {
  final double width;
  final String avatarUrl;

  const CircleAvatarWidget({super.key, required this.avatarUrl, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: width,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: ClipOval(
        child: CachedNetworkImage(
          imageUrl: avatarUrl,
          errorWidget: (context, url, error) {
            return const Icon(Icons.person);
          },
        ),
      ),
    );
  }
}

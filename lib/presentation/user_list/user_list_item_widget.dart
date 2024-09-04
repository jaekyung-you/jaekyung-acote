import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class UserListItemWidget extends StatelessWidget {
  final String nickname;
  final String avatarUrl;

  const UserListItemWidget({super.key, required this.nickname, required this.avatarUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 64,
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: ClipOval(child: CachedNetworkImage(imageUrl: avatarUrl)),
          ),
          const SizedBox(width: 8),
          Text(
            nickname,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../common/widget/circle_avatar_widget.dart';

class UserListItemWidget extends StatelessWidget {
  final String username;
  final String avatarUrl;

  const UserListItemWidget({super.key, required this.username, required this.avatarUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 64,
      child: Row(
        children: [
          CircleAvatarWidget(width: 44, avatarUrl: avatarUrl),
          const SizedBox(width: 8),
          Text(
            username,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}

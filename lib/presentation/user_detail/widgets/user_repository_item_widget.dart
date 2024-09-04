import 'package:flutter/material.dart';
import '../../../common/widget/circle_avatar_widget.dart';
import '../../../model/vo/repository_vo.dart';

class UserRepositoryItemWidget extends StatelessWidget {
  final RepositoryVo repo;

  const UserRepositoryItemWidget({super.key, required this.repo});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 100,
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatarWidget(width: 44, avatarUrl: repo.avatarUrl),
              const SizedBox(width: 8),
              Text(
                repo.username,
                style: const TextStyle(
                  fontSize: 14,
                ),
              )
            ],
          ),
          const SizedBox(height: 8),
          Text(
            repo.repoName,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),
          Text(
            repo.description,
            style: const TextStyle(fontSize: 14),
          ),
          const Spacer(),
          Row(
            children: [
              const Icon(
                Icons.star,
                size: 16,
              ),
              const SizedBox(width: 4),
              Text(
                '${repo.starCount}',
                style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(width: 16),
              CircleAvatar(
                backgroundColor: Colors.black,
                radius: 24,
              ),
              const SizedBox(width: 4),
              Text(
                repo.language,
                style: const TextStyle(fontSize: 14),
              ),
            ],
          )
        ],
      ),
    );
  }
}

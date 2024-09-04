import 'package:flutter/material.dart';
import '../../../common/widget/circle_avatar_widget.dart';
import '../../../model/vo/repository_vo.dart';

class UserRepositoryItemWidget extends StatelessWidget {
  final RepositoryVo repo;

  const UserRepositoryItemWidget({super.key, required this.repo});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      height: 180,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
          repo.description != null && repo.description!.isNotEmpty
              ? descriptionContent()
              : const SizedBox(
                  height: 8,
                ),
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
              if (repo.language != null && repo.language!.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: languageContent(),
                )
            ],
          )
        ],
      ),
    );
  }

  Widget descriptionContent() {
    return Expanded(
      child: Column(
        children: [
          const SizedBox(height: 8),
          Text(
            repo.description ?? '',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget languageContent() {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.black,
          radius: 8,
        ),
        const SizedBox(width: 4),
        Text(
          repo.language!,
          style: const TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}

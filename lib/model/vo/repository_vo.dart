// 저장소 리스트에 표기해줄 프로퍼티만
class RepositoryVo {
  final String repoName;
  final String? description;
  final String username;
  final String avatarUrl;
  final int starCount;
  final String? language;

  RepositoryVo({
    required this.repoName,
    this.description,
    required this.username,
    required this.avatarUrl,
    required this.starCount,
    this.language,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true; // 동일한 참조인 경우 true

    return other is RepositoryVo &&
        other.repoName == repoName &&
        other.description == description &&
        other.username == username &&
        other.avatarUrl == avatarUrl &&
        other.starCount == starCount &&
        other.language == language;
  }

  @override
  int get hashCode =>
      repoName.hashCode ^ description.hashCode ^ username.hashCode ^ avatarUrl.hashCode ^ starCount.hashCode ^ language.hashCode;
}

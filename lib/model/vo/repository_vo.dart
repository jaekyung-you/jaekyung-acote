// 저장소 리스트에 표기해줄 프로퍼티만
class RepositoryVo {
  final String repoName;
  final String description;
  final String username;
  final String avatarUrl;
  final int starCount;
  final String language;

  RepositoryVo({
    required this.repoName,
    required this.description,
    required this.username,
    required this.avatarUrl,
    required this.starCount,
    required this.language,
  });
}

import 'package:acote/model/vo/repository_vo.dart';
import 'package:acote/service/usecase/get_repo_list.dart';
import 'package:get/get.dart';
import '../model/repository_response.dart';

class UserDetailController extends GetxController {
  GetRepoList getRepoList = GetRepoList();

  RxBool isLoading = false.obs;
  List<RepositoryResponse> repoListResponse = <RepositoryResponse>[];
  RxList<RepositoryVo> repoVoList = <RepositoryVo>[].obs;
  String username = '';

  @override
  Future<void> onInit() async {
    super.onInit();
    if (Get.arguments['username'] != null) {
      username = Get.arguments['username'];
    }
    await getAllRepos();
  }

  Future<void> getAllRepos() async {
    if (isLoading.value) return;
    isLoading.value = true;
    repoVoList.clear();
    List<RepositoryResponse>? list = await getRepoList(username: username);
    if (list != null) {
      repoVoList.addAll(list.map((e) => convertToRepoVo(e)).toList());
    }
    isLoading.value = false;
  }

  RepositoryVo convertToRepoVo(RepositoryResponse response) {
    return RepositoryVo(
      repoName: response.name,
      description: response.description,
      username: response.owner.login,
      avatarUrl: response.owner.avatarUrl,
      starCount: response.stargazersCount,
      language: response.language,
    );
  }
}

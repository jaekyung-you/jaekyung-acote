import 'package:acote/service/usecase/get_repo_list.dart';
import 'package:get/get.dart';

import '../model/repository_response.dart';

class UserDetailController extends GetxController {
  GetRepoList getRepoList = GetRepoList();

  RxBool isLoading = false.obs;
  RxList<RepositoryResponse> repoList = <RepositoryResponse>[].obs;
  String username = '';

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments['username'] != null) {
      username = Get.arguments['username'];
    }
  }

  Future<void> getAllRepos() async {
    if (isLoading.value) return;
    isLoading.value = true;
    repoList.clear();
    List<RepositoryResponse>? list = await getRepoList(username: username);
    if (list != null) {
      repoList.addAll(list);
    }
    isLoading.value = false;
  }
}

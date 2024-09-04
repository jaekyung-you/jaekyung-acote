import 'package:acote/model/user_response.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../service/usecase/get_users.dart';

class UserListController extends GetxController {
  GetUsers getUsers = GetUsers();

  RxBool isLoading = false.obs;
  RxBool isFetching = false.obs; // pagination시 사용
  RxList<UserResponse> userList = <UserResponse>[].obs;
  int? lastId;
  int adInterval = 10;

  @override
  Future<void> onInit() async {
    super.onInit();
    await getAllUsers();
  }

  Future<void> getAllUsers() async {
    if (isLoading.value) return;
    isLoading.value = true;
    userList.clear();
    List<UserResponse>? list = await getUsers();
    if (list != null) {
      userList.addAll(list);
      lastId = userList.last.id;
    }
    isLoading.value = false;
  }

  Future<void> getMoreUsers() async {
    if (isFetching.value || lastId == null) return;
    isFetching.value = true;
    List<UserResponse>? list = await getUsers(lastId: lastId);
    if (list != null) {
      userList.addAll(list);
      lastId = userList.last.id;
    }
    isFetching.value = false;
  }

  bool isAdBanner(int index) {
    return (index + 1) % (adInterval + 1) == 0;
  }

  int getUserIndex(int index) {
    return index - (index ~/ (adInterval + 1));
  }

  int itemCount() {
    return userList.length + (userList.length ~/ adInterval);
  }

  Future<void> onTapAdd() async {
    Uri uri = Uri.parse('https://taxrefundgo.kr');

    try {
      await launchUrl(uri);
    } catch (e) {
      print('Fail to launch url: $e');
      return;
    }
  }
}

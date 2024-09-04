import 'package:acote/model/user_response.dart';
import 'package:get/get.dart';
import '../service/usecase/get_users.dart';

class UserListController extends GetxController {
  GetUsers getUsers = GetUsers();

  RxBool isLoading = false.obs;
  RxBool isFetching = false.obs; // pagination시 사용
  RxList<UserResponse> userList = <UserResponse>[].obs;
  int? lastId;

  @override
  Future<void> onInit() async {
    super.onInit();
    await getAllUsers();
  }

  Future<void> getAllUsers() async {
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
    if (lastId == null) return;
    isFetching.value = true;
    List<UserResponse>? list = await getUsers(lastId: lastId);
    if (list != null) {
      userList.addAll(list);
      lastId = userList.last.id;
    }
    isFetching.value = false;
  }
}

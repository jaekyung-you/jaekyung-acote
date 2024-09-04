import 'package:get/get.dart';

class UserDetailController extends GetxController {
  String username = '';

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments['username'] != null) {
      username = Get.arguments['username'];
    }
  }
}

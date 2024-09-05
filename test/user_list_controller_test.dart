import 'package:acote/controller/user_list_controller.dart';
import 'package:acote/service/dio_api_service.dart';
import 'package:acote/service/usecase/get_users.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

// 테스트 환경 설정
Future<void> init() async {
  DioApiBase dioApiBase = DioApiBase();
  await dioApiBase.init();
}

Future<void> main() async {
  await init();
  UserListController controller = Get.put(UserListController());

  group('Test user_list_controller business logic', () {
    test('should be an ad banner', () {
      expect(controller.isAdBanner(10), true);
    });

    test('should not be an ad banner', () {
      expect(controller.isAdBanner(11), false);
    });

    test('should get user index including ad', () {
      int index = 11;
      expect(controller.getUserIndex(index), 10);
    });

    test('should get user list item count including ad', () async {
      GetUsers getUsers = GetUsers();
      await getUsers();
      expect(controller.itemCount(), 33);
    });
  });
}

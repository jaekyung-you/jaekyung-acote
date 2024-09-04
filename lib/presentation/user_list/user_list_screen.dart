import 'package:acote/presentation/user_list/user_list_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/user_list_controller.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  late UserListController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.isRegistered<UserListController>() ? Get.find<UserListController>() : Get.put(UserListController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Text(
              '사용자',
              style: TextStyle(fontSize: 16),
            ),
            Obx(() {
              return Expanded(
                child: controller.isLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        itemCount: controller.userList.length,
                        itemBuilder: (context, index) {
                          return UserListItemWidget(
                            nickname: controller.userList[index].login,
                            avatarUrl: controller.userList[index].avatarUrl,
                          );
                          // return Text(controller.userList[index].login);
                        }),
              );
            })
          ],
        ),
      ),
    );
  }
}

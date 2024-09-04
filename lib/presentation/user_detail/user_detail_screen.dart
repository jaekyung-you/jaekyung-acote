import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/user_detail_controller.dart';
import 'widgets/user_repository_item_widget.dart';

class UserDetailScreen extends StatefulWidget {
  const UserDetailScreen({super.key});

  @override
  State<UserDetailScreen> createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  late UserDetailController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.isRegistered<UserDetailController>() ? Get.find<UserDetailController>() : Get.put(UserDetailController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text(
              controller.username,
              style: const TextStyle(fontSize: 16),
            ),
            Obx(
              () {
                return Expanded(
                  child: ListView.separated(
                    itemCount: controller.repoVoList.length,
                    separatorBuilder: (context, index) {
                      return Container(
                        color: Colors.grey.withOpacity(0.3),
                        width: double.infinity,
                        height: 10,
                      );
                    },
                    itemBuilder: (context, index) {
                      return UserRepositoryItemWidget(
                        repo: controller.repoVoList[index],
                      );
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

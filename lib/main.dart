import 'package:acote/routes/github_routes.dart';
import 'package:acote/service/dio_api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'presentation/user_list/user_list_screen.dart';

Future<void> main() async {
  // http 통신 라이브러리 설정
  DioApiBase dioApiBase = DioApiBase();
  await dioApiBase.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Github flutter project',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      getPages: GithubRoutes.routes,
      home: const UserListScreen(),
    );
  }
}

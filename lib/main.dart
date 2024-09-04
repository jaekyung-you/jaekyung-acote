import 'package:acote/service/dio_api_service.dart';
import 'package:flutter/material.dart';
import 'presentation/user_list_screen.dart';

Future<void> main() async {
  // http 통신 라이브러리 설정
  DioApiBase dioApiBase = DioApiBase();
  await dioApiBase.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const UserListScreen(),
    );
  }
}

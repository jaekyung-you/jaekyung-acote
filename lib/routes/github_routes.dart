import 'package:acote/presentation/user_list/user_list_screen.dart';
import 'package:acote/routes/github_page.dart';
import 'package:get/get.dart';

import '../presentation/user_detail/user_detail_screen.dart';

class GithubRoutes {
  GithubRoutes._privateConstructor();

  static final _instance = GithubRoutes._privateConstructor();

  factory GithubRoutes() {
    return _instance;
  }

  static final routes = [
    GetPage(name: GithubPage.USER_LIST, page: () => const UserListScreen()),
    GetPage(name: GithubPage.USER_DETAIL, page: () => const UserDetailScreen()),
  ];
}
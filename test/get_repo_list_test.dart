import 'package:acote/model/repository_response.dart';
import 'package:acote/service/dio_api_service.dart';
import 'package:acote/service/usecase/get_repo_list.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_users_test.mocks.dart';

@GenerateMocks([Dio])
Future<void> main() async {
  DioApiBase dioApiBase = DioApiBase();
  await dioApiBase.init();

  group('getRepoList', () {
    test('get reop list successfully', () async {
      final dio = MockDio();

      when(dio.get('https://api.github.com')).thenAnswer((_) async => Future.value(Response(
            data: {[]},
            statusCode: 200,
            requestOptions: RequestOptions(path: '/users/jaekyung-you/repos'),
          )));

      GetRepoList getRepoList = GetRepoList();
      expect(await getRepoList(username: 'jaekyung-you'), isA<List<RepositoryResponse>>());
    });

    test('throws an exception if the http call completes with an error', () async {
      final dio = MockDio();

      when(dio.get('https://api.github.com')).thenAnswer((_) async => Future.value(Response(
            data: {[]},
            statusCode: 401,
            requestOptions: RequestOptions(path: '/users/jaekyung-you/repos'),
          )));

      GetRepoList getRepoList = GetRepoList();
      expect(await getRepoList(username: 'jaekyung-you'), []);
    });
  });
}

import 'package:acote/model/user_response.dart';
import 'package:acote/service/dio_api_service.dart';
import 'package:acote/service/usecase/get_users.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_users_test.mocks.dart';

@GenerateMocks([Dio])
Future<void> main() async {
  DioApiBase dioApiBase = DioApiBase();
  await dioApiBase.init();

  group('getUsers', () {
    test('get users successfully', () async {
      final dio = MockDio();

      when(dio.get('https://api.github.com')).thenAnswer((_) async => Future.value(Response(
            data: {[]},
            statusCode: 200,
            requestOptions: RequestOptions(path: '/users'),
          )));

      GetUsers getUsers = GetUsers();
      expect(await getUsers(), isA<List<UserResponse>>());
    });

    test('throws an exception if the http call completes with an error', () async {
      final dio = MockDio();
      when(dio.get('https://api.github.com')).thenThrow(
        DioException(
          requestOptions: RequestOptions(path: '/users'),
          response: Response(
            statusCode: 401,
            requestOptions: RequestOptions(path: '/users'),
          ),
        ),
      );

      GetUsers getUsers = GetUsers();
      expect(getUsers(), throwsA(isA<DioException>()));
    });
  });
}

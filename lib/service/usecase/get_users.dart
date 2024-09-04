import 'package:acote/model/user_response.dart';
import 'package:dio/dio.dart';
import '../dio_api_service.dart';

class GetUsers {
  Future<List<UserResponse>?> call({int? lastId}) async {
    try {
      Response res = await DioApiBase().get('/users', lastId != null ? {'since': lastId} : null);
      if (res.statusCode == 200 && res.data.isNotEmpty) {
        List<UserResponse> list = res.data.map<UserResponse>((item) => UserResponse.fromJson(item)).toList();
        return list;
      } else {
        throw Exception('Failed to get users');
      }
    } catch (e) {
      print('❌Failed to get users: $e');
    }
    return null;
  }
}
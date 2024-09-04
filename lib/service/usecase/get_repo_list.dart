import 'package:acote/model/repository_response.dart';
import 'package:dio/dio.dart';
import '../dio_api_service.dart';

class GetRepoList {
  Future<List<RepositoryResponse>?> call({required String username}) async {
    Response res = await DioApiBase().get('/users/$username/repos', null);
    if (res.statusCode == 200 && res.data.isNotEmpty) {
      List<RepositoryResponse> list = res.data.map<RepositoryResponse>((item) => RepositoryResponse.fromJson(item)).toList();
      return list;
    } else {
      return null;
    }
  }
}

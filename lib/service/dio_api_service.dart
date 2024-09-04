import 'package:dio/dio.dart';

class DioApiBase {
  DioApiBase._privateConstructor();

  static final _instance = DioApiBase._privateConstructor();
  final Dio dio = Dio();

  factory DioApiBase() {
    return _instance;
  }

  Future<void> init() async {
    dio.options.baseUrl = 'https://api.github.com/users';
    dio.options.connectTimeout = const Duration(seconds: 5);
    dio.options.receiveTimeout = const Duration(seconds: 3);
  }

  Future<Response> get(String? path, Map<String, dynamic>? queryParam) async {
    Response? res;
    try {
      res = await dio.get(path ?? '', queryParameters: queryParam);
      return res;
    } catch (e) {
      print("DIO GET ERROR : $e");
      rethrow;
    }
  }
}

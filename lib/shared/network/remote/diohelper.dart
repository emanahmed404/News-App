
import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;
//we are using the second way which is create and config it
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    required Map<String, dynamic> query
  }) async
  {
    return await dio.get(url, queryParameters: query,);
  }
}
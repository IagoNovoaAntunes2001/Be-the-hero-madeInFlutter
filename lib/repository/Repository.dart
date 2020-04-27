import 'package:dio/dio.dart';

class Repository {
  Dio _service() {
    Dio dio = new Dio();
    dio.options.baseUrl = "https://omnistack-be-the-hero.herokuapp.com";
    dio.options.connectTimeout = 10000; // 10 sec;
    dio.options.receiveTimeout = 3000;
    return dio;
  }

  Future<dynamic> get(String path) async {
    Response response = await this._service().get(path);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return response.statusCode;
    }
  }
}

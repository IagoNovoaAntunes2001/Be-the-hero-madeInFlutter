import 'package:dio/dio.dart';

class Repository {
  Dio _service() {
    Dio dio = new Dio();
    dio.options.baseUrl = "http://192.168.156.2:3333";
    dio.options.connectTimeout = 10000; // 10 sec;
    dio.options.receiveTimeout = 3000;
    return dio;
  }

  Future<dynamic> get(String path) async {
    Response response = await this._service().get(path);
    if (response.statusCode == 200){
      //print(response.data);
      return response.data;
    } else {
      print(response.statusMessage);
      return response.statusCode;
    }
  }

}
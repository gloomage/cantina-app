import 'package:dio/dio.dart';

abstract class HttpMethods {
  static const String post = 'POST';
  static const String get = 'GET';
  static const String put = 'PUT';
  static const String patch = 'PATCH';
  static const String delete = 'DELETE';
}

class HttpManager {

  Future<Response<dynamic>> restRequest({ required String url, required String method, Map? body }) async {
 
    Dio dio = Dio();

    try {
      Response response = await dio.request(
        url,
        options: Options(
          method: method,
        ),
        data: body,
      );

      return response;

    } catch(e) {
      return Future.error("Error! Retorno vazio");
    }
  }
}

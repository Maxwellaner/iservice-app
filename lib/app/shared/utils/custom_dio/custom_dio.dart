import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../custom_dio/../constants.dart';

class CustomDio {
  var _dio;

  CustomDio() {
    _dio = Dio(BaseOptions(baseUrl: URL_BASE));
  }

  Dio get instance => _dio;

  CustomDio.authentication() {
    _dio = Dio(BaseOptions(baseUrl: URL_BASE));
    _dio.interceptors.add(InterceptorsWrapper(
        onRequest: _onRequest, onResponse: _onResponse, onError: _onError));
  }

  _onRequest(RequestOptions options) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.get('token');
    options.headers['Authorization'] = 'Bearer ' + token;
  }

  _onResponse(Response e) {
    print('Start response log');
    print(e.data);
    print('End response log');
  }

  _onError(DioError e) {
    return e.error.toString();
  }
}

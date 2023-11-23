import 'package:dio/dio.dart';


import '../utils/constant.dart';
import 'error_handel_interceptor.dart';

class DioHelper {
  Dio dio = Dio();

  init() async {
    dio.options.connectTimeout = 5 * 1000;
    dio.options.receiveTimeout = 5 * 1000;
    dio.options.sendTimeout = 5 * 1000;
    addInterceptors();
  }

  addInterceptors() {
    removeAllInterceptor();
    dio.interceptors.add(ErrorHandelInterceptor());
  }

  removeAllInterceptor() {
    for (int i = 0; i < dio.interceptors.length; i++) {
      dio.interceptors.removeAt(i);
    }
  }
}

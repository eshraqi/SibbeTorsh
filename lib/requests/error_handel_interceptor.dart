import 'package:dio/dio.dart' as myDio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/response_error.dart';
import '../utils/constant.dart';
import 'dio_helper.dart';

class ErrorHandelInterceptor extends myDio.Interceptor {
  var dio = Get.find<DioHelper>().dio;
  var dioHelper = Get.find<DioHelper>();
  SharedPreferences prefs = Get.find();

  @override
  Future<void> onError(
      myDio.DioError err, myDio.ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode != 200 && err.response?.statusCode != 201) {
      try {
        if (err.response != null) {
          var responseBody = responseErrorFromJson(err.response!.data);

          Get.snackbar(
            '',
            '',
            titleText: const Text('Error',
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                )),
            backgroundColor: Colors.black.withOpacity(0.5),
            barBlur: 5,
            overlayBlur: 3,
            messageText: Text(responseBody.message,
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                )),
            snackStyle: SnackStyle.FLOATING,
            snackPosition: SnackPosition.BOTTOM,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          );
        } else {
          Get.snackbar(
            '',
            '',
            titleText: const Text('Error',
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                )),
            backgroundColor: Colors.black.withOpacity(0.5),
            barBlur: 5,
            overlayBlur: 3,
            messageText: const Text('Please check your network connection',
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                )),
            snackStyle: SnackStyle.FLOATING,
            snackPosition: SnackPosition.BOTTOM,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          );
        }

        return handler.resolve(err.response ??
            myDio.Response<dynamic>(
                requestOptions: myDio.RequestOptions(path: Constant.baseUrl),
                statusCode: 500));
      } catch (e) {
        Get.snackbar(
          '',
          '',
          titleText: const Text('Error',
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: 16,
              )),
          backgroundColor: Colors.black.withOpacity(0.5),
          barBlur: 5,
          overlayBlur: 3,
          messageText: Text(
              'Unspecified error ${err.response?.statusCode}. Make sure you have an internet connection',
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 14,
              )),
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        );
        var res = myDio.Response<dynamic>(
            requestOptions: myDio.RequestOptions(path: Constant.baseUrl),
            statusCode: 500);
        return handler.resolve(err.response ?? res);
      }
    }
  }
}

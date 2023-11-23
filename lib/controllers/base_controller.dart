import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/app_color.dart';

class BaseController extends GetxController {
  SharedPreferences prefs = Get.find();

  bool isLoading = false;

  ///base on isLoading show or dismiss loading
  ///loading is for when you want to be sure loading is off, just make loading = false
  toggleLoading(bool loading) {
    isLoading = loading;
    update();
  }

  showSnackBar(title, message,{Duration? duration}) {
    Get.snackbar(
      '',
      '',
      titleText: Text(title,
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
            fontSize: 16,
          )),
      backgroundColor: Colors.black.withOpacity(0.5),
      barBlur: 5,
      overlayBlur: 3,
      duration: duration?? const Duration(seconds: 3),
      messageText: Text(message,
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
  }
}

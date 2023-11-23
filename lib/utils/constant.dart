import 'package:flutter/material.dart';

class Constant {
  static String baseUrl = "https://reqres.in/";

  static TextDirection appTextDirection = TextDirection.rtl;

  static void closeKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

}

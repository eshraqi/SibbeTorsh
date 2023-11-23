import 'dart:developer';
import 'dart:html';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sibetorsh/model/response_add_user.dart';
import 'package:sibetorsh/model/response_user.dart';
import '../requests/requests.dart';
import 'base_controller.dart';

class AuthController extends BaseController {
  int? page;
  int? perPage;
  int? total;
  int? totalPages;
  List<Datum> data = [];
  Support? support;
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;
  //
  // void user() async {
  //   toggleLoading(true);
  //   final response = await Requests().user();
  //   toggleLoading(false);
  //  if (response.statusCode == 200) {
  //     final result = responseUserFromJson(response.data);
  //     data = result.data;
  //     log('data: $data');
  //   }
  // }

  void userSibeTorsh() async {
    toggleLoading(true);
    final response = await Requests().user();
    toggleLoading(false);
    if (response.statusCode == 200) {
      final result = responseUserFromJson(response.data);
      log('result: $result');
      data = result.data;
    }
  }

  void addUser() async {
    toggleLoading(true);
    final response = await Requests().addUser(firstName!, lastName!);
    toggleLoading(false);
    if (response.statusCode == 200) {
      final result = responseAddUserFromJson(response.data);
      print('کاربر اضافه شد');
     // result.id;
     //  Get.snackbar(
     //    '',
     //    '',
     //    backgroundColor: Colors.black.withOpacity(0.5),
     //    barBlur: 5,
     //    overlayBlur: 3,
     //    messageText: const Text('کاربر اضافه شد',
     //        textDirection: TextDirection.rtl,
     //        textAlign: TextAlign.center,
     //        style: TextStyle(
     //          color: Colors.white,
     //          fontWeight: FontWeight.w700,
     //          fontSize: 14,
     //        )),
     //    snackStyle: SnackStyle.FLOATING,
     //    snackPosition: SnackPosition.BOTTOM,
     //    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
     //  );
      log('id: $result.id');
    }
  }
}

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sibetorsh/controllers/auth_controller.dart';
import 'package:sibetorsh/model/response_user.dart';
import 'package:sibetorsh/utils/app_color.dart';
import '../widgets/page_base.dart';

class MainPage extends StatelessWidget {
  AuthController authController = Get.find();

  MainPage({super.key}) {
    authController.userSibeTorsh();
  }

  //List<Datum>? data;

  @override
  Widget build(BuildContext context) {

    return GetBuilder<AuthController>(builder: (context) {
      return PageBase(
          backgroundColor: AppColor.colorPrimary,
          isLoading: authController.isLoading,
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
                child: SingleChildScrollView(
              child: authController.data == null
                  ? const Center(
                  child: SizedBox(
                      width: 56,
                      height: 56,
                      child: CircularProgressIndicator()))
                  : ListView.builder(
                      itemCount: authController.data.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return itemList(index, authController.data);
                      }),
            )),
          ));
    });
  }

  itemList(int index, List<Datum> data) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              data[index].firstName,
              style: const TextStyle(
                color: AppColor.orange,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              data[index].lastName,
              style: const TextStyle(
                color: AppColor.grayText,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              data[index].email,
              style: const TextStyle(
                color: AppColor.grayText,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ));
  }
}

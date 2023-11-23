import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sibetorsh/controllers/auth_controller.dart';
import 'package:sibetorsh/utils/app_color.dart';
import 'package:sibetorsh/view/user_list_page.dart';
import '../widgets/button_normal.dart';
import '../widgets/page_base.dart';
import '../widgets/text_input.dart';

class AddUserPage extends StatelessWidget {
  AuthController authController = Get.find();
  final _formKey = GlobalKey<FormState>();

  AddUserPage({super.key});

  @override
  Widget build(BuildContext context) {

    return GetBuilder<AuthController>(builder: (context) {
      return PageBase(
          backgroundColor: AppColor.colorPrimary,
          isLoading: authController.isLoading,
          body: Padding(
            padding: const EdgeInsets.all(24),
            child: Center(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const Text(
                        "افزودن کاربر",
                        style: TextStyle(
                          color: AppColor.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 50),
                      TextInput(
                          label: "نام را وارد کنید",
                          textInputType: TextInputType.name,
                          enabled: false,
                          initialValue: authController.firstName,
                          onSave: (String? value) {
                            authController.firstName = value;
                          },
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'پر کردن فیلد نام اجباری است';
                            }
                          }),
                      const SizedBox(height: 16),
                      TextInput(
                          label: "نام خانوادگی را وارد کنید",
                          textInputType: TextInputType.name,
                          enabled: false,
                          initialValue: authController.lastName,
                          onSave: (String? value) {
                            authController.lastName = value;
                          },
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'پر کردن فیلد نام خانوادگی اجباری است';
                            }
                          }),

                      const SizedBox(height: 80),
                      Directionality(
                        textDirection: TextDirection.ltr,
                        child: Row(children: [
                          Expanded(
                              child: ButtonNormal(
                                  backgroundColor: AppColor.copyButton,
                                  textColor: AppColor.colorPrimary,
                                  text: "لیست کاربران",
                                  onPressed: () {
                                    authController.userSibeTorsh();
                                    Get.to(() => UserListPage());
                                  })),
                          const SizedBox(width: 16),
                          Expanded(
                              child: ButtonNormal(
                                  backgroundColor: AppColor.copyButton,
                                  textColor: AppColor.colorPrimary,
                                  text: "افزودن کاربر",
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      _formKey.currentState!.save();
                                      authController.addUser();
                                    }
                                  })),
                        ]),
                      )
                      ],
                  ),
                ),
                )),
          );
    });
  }

}

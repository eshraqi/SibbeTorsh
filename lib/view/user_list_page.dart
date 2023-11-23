import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sibetorsh/controllers/auth_controller.dart';
import 'package:sibetorsh/model/response_user.dart';
import 'package:sibetorsh/utils/app_color.dart';
import '../widgets/page_base.dart';
import 'package:cached_network_image/cached_network_image.dart';

class UserListPage extends StatelessWidget {
  AuthController authController = Get.find();

  UserListPage({super.key}) {
    authController.userSibeTorsh();
  }

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
        child: Row(
            children: [
             Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 9),
                  child: CachedNetworkImage(
                      imageUrl: data[index].avatar,
                      fit: BoxFit.cover,
                    ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text(
                    data[index].firstName,
                    style: const TextStyle(
                      color: AppColor.grayText,
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
             ]),
    )
    ]));

  }
}

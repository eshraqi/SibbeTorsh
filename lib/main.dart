import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sibetorsh/controllers/auth_controller.dart';
import 'package:sibetorsh/requests/dio_helper.dart';
import 'package:sibetorsh/view/add_user_page.dart';
import 'package:sibetorsh/view/user_list_page.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  Get.put(prefs);
  DioHelper dioHelper = DioHelper();
  Get.put(AuthController());
  Get.put(dioHelper);
  dioHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'sibetorsh',
      theme: ThemeData(
        fontFamily: 'vazirmatn',
        primaryColor: const Color(0x00ffffff),
      ),
      debugShowCheckedModeBanner: false,
      home: AddUserPage(),
    );
  }


}


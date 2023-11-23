import 'dart:developer';
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

  void userSibeTorsh() async {
    toggleLoading(true);
    final response = await Requests().user();
    toggleLoading(false);
    if (response.statusCode == 200) {
      final result = responseUserFromJson(response.data);
      data = result.data;
    }
  }

  void addUser() async {
    toggleLoading(true);
    final response = await Requests().addUser(firstName!, lastName!);
    toggleLoading(false);
    if (response.statusCode == 200) {
      final result = responseAddUserFromJson(response.data);
      showSnackBar("تبریک",'کاربر اضافه شد');

    }
  }
}

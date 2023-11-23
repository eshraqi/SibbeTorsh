import 'package:dio/dio.dart';
import 'package:get/get.dart' as myGet;
import '../utils/constant.dart';
import 'dio_helper.dart';

class Requests {
  var dio = myGet.Get.find<DioHelper>().dio;

  Future<Response> user() async {
    final response = await dio.get('${Constant.baseUrl}api/users?page=1');
    return response;
  }

  Future<Response> addUser(String first_name, String last_name) async {
    final response = await dio.post('${Constant.baseUrl}api/users',
        data: {'first_name': first_name,
              'last_name': last_name});
    return response;
  }

}

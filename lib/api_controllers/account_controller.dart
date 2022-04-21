import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:itfest/api_controllers/department_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api_enums.dart';

class AccountController {
  static Future<int> login(String email, String password) async{


    Uri url = Uri.parse(Api.domain + "account/login");
    Dio dio = Dio();
    var result = await dio.postUri(url, options: Api.options, data: {
      "Email": email,
      "Password": password
    });

    print(result.statusCode);

    print(result.data);

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString("accessToken", result.data['token']);

    return result.statusCode!;
  }

  static Future<int> createEmployee(dynamic data, String accessToken) async{
    try {
      var depResult = await DepartmentController.create(
          data['departmentName'], accessToken);
      print(depResult);
    }
    catch(e){
      print(e);
    }
    Uri url = Uri.parse(Api.domain + "account/create");
    Dio dio = Dio();
    var result = await dio.postUri(url, options: Api.authorizeOptions(accessToken), data: data);

    print(result.statusCode);

    print(result.data);

    return result.statusCode!;
  }

  static Future getAll() async {
    Uri url = Uri.parse(Api.domain + "account/get/all");
    Dio dio = Dio();
    var result = await dio.getUri(url, options: Api.options);

    print(result.statusCode);

    return result;
  }

  static Future accountInfo(String accessToken) async {
    Uri url = Uri.parse(Api.domain + "account/info");
    Dio dio = Dio();
    var result = await dio.getUri(url, options: Api.authorizeOptions(accessToken));

    print(result.statusCode);

    return result;
  }
}
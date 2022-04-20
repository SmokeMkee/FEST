import 'dart:convert';

import 'package:dio/dio.dart';
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

}
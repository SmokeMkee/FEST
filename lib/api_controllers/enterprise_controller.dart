import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:itfest/api_controllers/api_enums.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EnterpriseController {
  static void initialize  (String adminEmail, String accountingEmail, String technicalSupportEmail) async {
    Uri url = Uri.parse(Api.domain + "enterprise/initialize?adminEmail=" + adminEmail + "&accountingEmail=" + accountingEmail + "&technicalSupportEmail=" + technicalSupportEmail);

    Dio dio = Dio();
    var result = await dio.postUri(url, options: Api.options);

    print(result.statusCode);
  }

  static Future<int> isInitialized() async {

    Uri url = Uri.parse(Api.domain + "enterprise/is-initialized");

    Dio dio = Dio();
    var result = await dio.getUri(url, options: Api.options);

    return result.statusCode!;
  }
}
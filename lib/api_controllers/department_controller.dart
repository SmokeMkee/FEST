import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api_enums.dart';

class DepartmentController {

  static Future<int> create(String name, String accessToken) async{
    Uri url = Uri.parse(Api.domain + "department/create");
    Dio dio = Dio();
    var result = await dio.postUri(url, options: Api.authorizeOptions(accessToken), data: {"name": name});

    print(result.statusCode);

    print(result.data);

    return result.statusCode!;
  }

  static Future<dynamic> get() async{
    Uri url = Uri.parse(Api.domain + "department/get");
    Dio dio = Dio();
    var result = await dio.getUri(url, options: Api.options);

    print(result.statusCode);

    print(result.data);
    return result.data;
  }

}
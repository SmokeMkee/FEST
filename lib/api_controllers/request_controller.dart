import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api_enums.dart';


class RequestController{
  static Future<int> createPattern (dynamic data, String accessToken) async{
    Uri url = Uri.parse(Api.domain + "request/pattern/create");
    Dio dio = Dio();
    var result = await dio.postUri(url, options: Api.authorizeOptions(accessToken), data: data);

    print(result.statusCode);

    print(result.data);

    return result.statusCode!;
  }

  static Future<List> get(String departmentName) async {
    Uri url = Uri.parse(Api.domain + "request/pattern/get/" + departmentName);
    Dio dio = Dio();
    var result = await dio.getUri(url, options: Api.options);

    print(result.statusCode);

    print(result.data);

    return (result.data! as List);
  }

  static Future getById(int id) async {
    Uri url = Uri.parse(Api.domain + "request/pattern/get/" + id.toString());
    Dio dio = Dio();
    var result = await dio.getUri(url, options: Api.options);

    print(result.statusCode);

    print(result.data);

    return (result.data);
  }
}
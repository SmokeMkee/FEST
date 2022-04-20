import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api_enums.dart';

class NewsController {
  static String acc= "";
  static Future<int> news(dynamic data, String accsestoken) async{
    acc = accsestoken;
    Uri url = Uri.parse(Api.domain + "post/create");
    Dio dio = Dio();
    print(data);
    var result = await dio.postUri(url, options: Api.authorizeOptions(accsestoken), data: jsonEncode(data));
    print(data);
    return result.statusCode!;
  }

  static Future<dynamic> getNews(String accsestoken) async{
    Uri url = Uri.parse(Api.domain + "post/get/all/");
    Dio dio = Dio();
    var result = await dio.getUri(url, options:Api.authorizeOptions(accsestoken));

    print(result.statusCode);

    print(result.data);

    return result.data;
  }


}
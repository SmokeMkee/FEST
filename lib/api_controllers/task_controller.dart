import 'package:dio/dio.dart';

import 'api_enums.dart';

class TaskController{
  static Future create(dynamic data, String accessToken) async {
    Uri url = Uri.parse(Api.domain + "task/create");
    Dio dio = Dio();
    var result = await dio.postUri(url, options: Api.authorizeOptions(accessToken), data: data);

    print(result.statusCode);

    print(result.data);

    return result;
  }

  static Future get(List<int> users, String accessToken) async {
    String url = Api.domain + "task/get?";

    for(int i = 0; i < users.length; i++){
      url += "users=" + users[i].toString();
      if(i < users.length - 1){
        url += "&";
      }
    }

    Dio dio = Dio();
    var result = await dio.getUri(Uri.parse(url), options: Api.authorizeOptions(accessToken));

    print(result.statusCode);

    print(result.data);

    return result;
  }
}
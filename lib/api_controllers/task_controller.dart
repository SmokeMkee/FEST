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
}
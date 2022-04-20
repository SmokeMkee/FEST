import 'package:dio/dio.dart';

class Api{
  static String domain = "http://10.0.2.2:5000/";
  static Map<String, String> headers = {
    "Accept": "application/json; charset=utf-8",
    "Content-Type": "application/json;charset=utf-8",
    };

  static Options options = Options(followRedirects: true, headers: headers);

  static Options authorizeOptions (String accessToken) {
    return Options(
        followRedirects: true, headers: authorizationHeaders(accessToken));
  }

    static Map<String, String> authorizationHeaders (String accessToken) {

      return {
        "Accept": "application/json; charset=utf-8",
        "Content-Type": "application/json;charset=utf-8",
      };
    }

}
import 'dart:developer';

import 'package:dio/dio.dart';

import '../../core/api/api_configuration.dart';
import '../../core/theme/access_token/token.dart';

class MyBookings {
  Dio dio = Dio();
  Map<String, dynamic> job = {};
  Future<Map<String, dynamic>> getAllBookings() async {
    String path = ApiConfigration.baseUrl + ApiConfigration.myBookings;

    String? token = await getExpertAccesToken();
    try {
      Response response = await dio.get(path,
          options: Options(headers: {"authorization": "Bearer $token"}));

      if (response.statusCode == 200) {
        job = response.data;
        log('======booking details=======${job}');

        return job;
      }
    } catch (e) {}
    return job;
  }
}

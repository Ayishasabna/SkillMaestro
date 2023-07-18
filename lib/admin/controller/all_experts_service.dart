import 'dart:developer';
import 'package:dio/dio.dart';
import '../../core/api/api_configuration.dart';
import '../../core/theme/access_token/token.dart';

class FetchAllExpertsDetails {
  Dio dio = Dio();

  Map<String, dynamic> experts = {};
  Future<Map<String, dynamic>> fetchAllExpertsDetails() async {
    String path = ApiConfigration.baseUrl +
        ApiConfigration.admin +
        ApiConfigration.getExperts;

    String? token = await getAdminAccesToken();
    try {
      Response response = await dio.get(path,
          options: Options(headers: {"authorization": "Bearer $token"}));

      if (response.statusCode == 200) {
        experts = response.data;

        return experts;
      }
    } catch (e) {
      log(e.toString());
    }
    return experts;
  }

}

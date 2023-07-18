import 'dart:developer';
import 'package:dio/dio.dart';
import '../../core/api/api_configuration.dart';
import '../../core/theme/access_token/token.dart';

class FetchAllJobDetails {
  Dio dio = Dio();

  Map<String, dynamic> jobs = {};
  Future<Map<String, dynamic>> fetchAllJobsDetails() async {
    String path = ApiConfigration.baseUrl +
        ApiConfigration.admin +
        ApiConfigration.getJobs;

    String? token = await getAdminAccesToken();
    try {
      Response response = await dio.get(path,
          options: Options(headers: {"authorization": "Bearer $token"}));

      if (response.statusCode == 200) {
        jobs = response.data;

        return jobs;
      }
    } catch (e) {
      log(e.toString());
    }
    return jobs;
  }

  
}

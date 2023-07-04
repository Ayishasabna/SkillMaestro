import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:skillmaestro/core/theme/access_token/token.dart';

import '../../core/api/api_configuration.dart';

class AllJobService {
  Dio dio = Dio();
  Map<String, dynamic> job = {};
  Map<String, dynamic> selectedJob = {};
  Future<Map<String, dynamic>> getAllJobs() async {
    String path = ApiConfigration.baseUrl + ApiConfigration.getAllJobs;

    String? token = await getExpertAccesToken();
    try {
      Response response = await dio.get(path,
          options: Options(headers: {"authorization": "Bearer $token"}));

      if (response.statusCode == 200) {
        job = response.data;
        log('======expertjsondecode=======${job}');

        return job;
      }
    } catch (e) {}
    return job;
  }

  Future<Map<String, dynamic>> getJobsByExpert() async {
    String path = ApiConfigration.baseUrl + ApiConfigration.getMyJobs;

    String? token = await getExpertAccesToken();
    try {
      Response response = await dio.get(path,
          options: Options(headers: {"authorization": "Bearer $token"}));

      if (response.statusCode == 200) {
        selectedJob = response.data;
        log('======result============${selectedJob}');

        return selectedJob;
      }
    } catch (e) {}
    return selectedJob;
  }
}

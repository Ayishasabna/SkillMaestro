import 'dart:developer';
import 'package:dio/dio.dart';
import '../../core/api/api_configuration.dart';
import '../../core/theme/access_token/token.dart';
import '../model/all_jobs_response_model.dart';

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
        log('======usersjsondecode=======${jobs}');

        return jobs;
      }
    } catch (e) {}
    return jobs;
  }

  /* Future<List<JobListModel>?> fetchAllJobsDetails() async {
    String path = ApiConfigration.baseUrl +
        ApiConfigration.admin +
        ApiConfigration.getJobs;

    String path1 = ApiConfigration.baseUrl +
        ApiConfigration.admin +
        ApiConfigration.adminAuth;

    String? token = await getAdminAccesToken();
    log("Inside admin controllerallexperts${token}");

    try {
      Response res = await dio.get(path1,
          options: Options(headers: {"authorization": "Bearer $token"}));
      if (res.statusCode == 200 || res.statusCode == 201) {
        Response response = await dio.get(path,
            options: Options(headers: {"authorization": "Bearer $token"}));

        log("inside response 200${response.data}");

        if (response.data is Map<String, dynamic>) {
/* 
          final JobListModel jobListModel = JobListModel.fromJson(response.data);
  final List<jobProfile> allJobs = jobListModel.result;
  return allJobs; */
          final List<JobListModel> allJobs = [
            JobListModel.fromJson(response.data)
          ];
          /* final List<jobProfile> alljobsList = [
            jobProfile.fromJson(response.data)
          ]; */
          log("allExperts.toString()::::$allJobs");
          return allJobs;
        } else if (response.data is List<dynamic>) {
          final List<JobListModel> allJobs =
              (response.data['results'] as List<dynamic>)
                  .map((e) => JobListModel.fromJson(e))
                  .toList();
          log("allExperts.toString()::::$allJobs");
          return allJobs;
        } else {
          throw Exception("Invalid response data format");
        }
      }

      /*  final List<AllExpertsByAdmin> allExperts = (response.data as List)
            .map((e) => AllExpertsByAdmin.fromJson(e))
            .toList();
        log("allExperts.toString()::::$allExperts");
        return allExperts;
      } */
    } on DioException catch (e) {
      log(e.message.toString());
    }
    return null;
  } */
}

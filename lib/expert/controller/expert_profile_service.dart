import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:skillmaestro/core/theme/access_token/token.dart';
import 'package:skillmaestro/expert/model/expert_get_jobs_model.dart';
import 'package:skillmaestro/expert/model/expert_profile_model.dart';

import '../../core/api/api_configuration.dart';
import '../model/expert_edit_profile_model.dart';

class ExpertProfileService {
  Dio dio = Dio();

  Future<ExpertProfileModel?> ExpertProfile() async {
    String path = ApiConfigration.baseUrl + ApiConfigration.expertAuth;

    String? token = await getExpertAccesToken();
    try {
      Response response = await dio.get(path,
          options: Options(headers: {"Authorization": "Bearer $token"}));
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(jsonEncode(response.data));
        var ExpertDetails = ExpertProfileModel.fromJson(jsonResponse);
        log(ExpertDetails.toString());
        return ExpertDetails;
      }
    } on DioException catch (e) {
      log(e.message.toString());
    }
    return null;
  }

  Future<void> editExpertProfile(EditExpertProfileModel editData) async {
    String path = ApiConfigration.baseUrl + ApiConfigration.editProfile;

    String? token = await getExpertAccesToken();
    try {
      Response response = await dio.patch(path,
          data: jsonEncode(editData.toJson()),
          options: Options(headers: {"Authorization": "Bearer $token"}));
      if (response.statusCode == 200) {
        log('profile editing successful');
      }
    } on DioException catch (e) {
      log(e.message.toString());
    }
  }

  List<JobRoleModel> jobList = [];

  Future expertGetJobs() async {
    String path = ApiConfigration.baseUrl + ApiConfigration.getMyJobs;
    Response response = await dio.get(path);
    if (response.statusCode == 200) {
      if (response.data is Map<String, dynamic>) {
        final List<JobRoleModel> jobList = [
          JobRoleModel.fromJson(response.data)
        ];
        log('------joblist----$jobList');
      }
    } else {
      throw Exception("Invalid response data format");
    }
    return jobList;
  }
}

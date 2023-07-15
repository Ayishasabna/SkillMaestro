import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../core/api/api_configuration.dart';
import '../../core/theme/access_token/token.dart';
import '../model/end_job_model.dart';
import '../model/send_estimate_model.dart';

class JobDetailServioce {
  Dio dio = Dio();
  FlutterSecureStorage storage = const FlutterSecureStorage();

  // ignore: non_constant_identifier_names
  Future sendEstimate(
    SendEstimateModel sendEstimateModel,
  ) async {
    String path = ApiConfigration.baseUrl + ApiConfigration.sendEstimate;

    try {
      String? token = await getExpertAccesToken();
      Response response = await dio.post(path,
          data: jsonEncode(sendEstimateModel.toJson()),
          options: Options(headers: {"authorization": "Bearer $token"}));

      if (response.statusCode == 200 || response.statusCode == 201) {
        log('__________responsedatasendestimate_________${response.data}');
        // final ExpertSignInResModel responseData =
        //     ExpertSignInResModel.fromJson(response.data);
      }
    } on DioException catch (e) {
      log(e.message.toString());
    }

    return null;
  }

  Future StartJob(
    String id,
  ) async {
    String path = ApiConfigration.baseUrl + ApiConfigration.startJob + '/${id}';

    try {
      String? token = await getExpertAccesToken();
      Response response = await dio.get(path,
          options: Options(headers: {"authorization": "Bearer $token"}));

      if (response.statusCode == 200 || response.statusCode == 201) {
        log('__________startjob_________${response.data}');
        // final ExpertSignInResModel responseData =
        //     ExpertSignInResModel.fromJson(response.data);
      }
    } on DioException catch (e) {
      log(e.message.toString());
    }

    return null;
  }

  Future EndJob(EndJobModel endJobModel) async {
    String path = ApiConfigration.baseUrl + ApiConfigration.endJob;
    log('____________--endjobCntroller_______________');
    try {
      String? token = await getExpertAccesToken();
      Response response = await dio.post(path,
          data: jsonEncode(endJobModel.toJson()),
          options: Options(headers: {"authorization": "Bearer $token"}));

      if (response.statusCode == 200 || response.statusCode == 201) {
        log('__________Endjob_________${response.data}');
        // final ExpertSignInResModel responseData =
        //     ExpertSignInResModel.fromJson(response.data);
      }
    } on DioException catch (e) {
      log(e.message.toString());
    }

    return null;
  }
}

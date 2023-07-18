import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skillmaestro/user/model/book_job_request_model.dart';
import '../../application/common/common_provider.dart';
import '../../core/api/api_configuration.dart';
import '../../core/theme/access_token/token.dart';
import '../model/add_adress_model.dart';

class FetchJobs {
  Dio dio = Dio();
  Map<String, dynamic> job = {};
  Map<String, dynamic> booking = {};
  Future<Map<String, dynamic>> fetch7Jobs() async {
    String path = ApiConfigration.baseUrl + ApiConfigration.get7Jobs;

    try {
      Response response = await dio.get(
        path,
      );

      if (response.statusCode == 200) {
        job = response.data;

        return job;
      }
    } catch (e) {
      log(e.toString());
    }
    return job;
  }

  // ignore: non_constant_identifier_names
  Future<Map<String, dynamic>> getJobDetail(String job_role) async {
    String path =
        // ignore: prefer_interpolation_to_compose_strings
        ApiConfigration.baseUrl + ApiConfigration.jobDetail + '/$job_role';

    String? token = await getUserAccesToken();
    try {
      Response response = await dio.get(path,
          options: Options(headers: {"authorization": "Bearer $token"}));

      if (response.statusCode == 200) {
        job = response.data;

        return job;
      }
    } catch (e) {
      log(e.toString());
    }
    return job;
  }

  Future<Map<String, dynamic>> getSlots(String id) async {
    // ignore: prefer_interpolation_to_compose_strings, unnecessary_string_interpolations
    String path = ApiConfigration.baseUrl + ApiConfigration.getSlots + '$id';

    String? token = await getUserAccesToken();

    try {
      Response response = await dio.get(path,
          options: Options(headers: {"authorization": "Bearer $token"}));

      if (response.statusCode == 200) {
        job = response.data;

        return job;
      }
    } catch (e) {
      log(e.toString());
    }
    return job;
  }

  // ignore: non_constant_identifier_names
  Future<String> AddUserAddress(
      AddAddressModel addAddressModel, BuildContext context) async {
    String path = ApiConfigration.baseUrl + ApiConfigration.addAddress;
    String? token = await getUserAccesToken();
    try {
      Response response = await dio.post(path,
          data: jsonEncode(addAddressModel.toJson()),
          options: Options(headers: {"authorization": "Bearer $token"}));

      if (response.statusCode == 200 || response.statusCode == 201) {
        return 'Success';
      }
    } on DioException catch (e) {
      // ignore: use_build_context_synchronously
      Provider.of<CommonProvider>(context, listen: false).loading = false;
      log(e.error.toString());
    }

    return '';
  }

  // ignore: non_constant_identifier_names
  Future<Map<String, dynamic>> BookJob(
      BookJobRequestModel jobModel, BuildContext context) async {
    String path = ApiConfigration.baseUrl + ApiConfigration.bookJob;
    String? token = await getUserAccesToken();

    try {
      Map<String, dynamic> requestData = {
        'jobId': jobModel.jobId,
        'time': jobModel.slots,
        'date': jobModel.date,
        'address': jobModel.address,
      };

      Response response = await dio.post(
        path,
        data: requestData,
        options: Options(headers: {"authorization": "Bearer $token"}),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return booking;
      }
    } on DioException catch (e) {
      // ignore: use_build_context_synchronously
      Provider.of<CommonProvider>(context, listen: false).loading = false;
      log(e.error.toString());
    }

    return booking;
  }
}

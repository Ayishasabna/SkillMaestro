import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skillmaestro/user/model/book_job_response_model.dart';
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

    //String? token = await getAdminAccesToken();
    try {
      Response response = await dio.get(
        path,
        //options: Options(headers: {"authorization": "Bearer $token"})
      );

      if (response.statusCode == 200) {
        job = response.data;
        //log('======usersjsondecode=======${users}');

        return job;
      }
    } catch (e) {}
    return job;
  }

  Future<Map<String, dynamic>> getJobDetail(String job_role) async {
    String path =
        ApiConfigration.baseUrl + ApiConfigration.jobDetail + '/${job_role}';
    log("_______________________$path");
    String? token = await getUserAccesToken();
    try {
      Response response = await dio.get(path,
          options: Options(headers: {"authorization": "Bearer $token"}));

      if (response.statusCode == 200) {
        job = response.data;
        log('________________________jobdetail_______________${response.data}');

        return job;
      }
    } catch (e) {}
    return job;
  }

  Future<Map<String, dynamic>> getSlots(String id) async {
    String path = ApiConfigration.baseUrl + ApiConfigration.getSlots + '$id';
    log('==========usertoken=======$path');

    String? token = await getUserAccesToken();

    try {
      if (token != null) {}
      Response response = await dio.get(path,
          options: Options(headers: {"authorization": "Bearer $token"}));

      if (response.statusCode == 200) {
        job = response.data;
        log('======getslotes==kkkkkk=====${job}');

        return job;
      }
    } catch (e) {}
    return job;
  }

  Future<String> AddUserAddress(
      AddAddressModel addAddressModel, BuildContext context) async {
    String path = ApiConfigration.baseUrl + ApiConfigration.addAddress;
    String? token = await getUserAccesToken();
    try {
      Response response = await dio.post(path,
          data: jsonEncode(addAddressModel.toJson()),
          options: Options(headers: {"authorization": "Bearer $token"}));

      log("======================================addaddressmodel======${addAddressModel.name}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return 'Success';
      }
    } on DioException catch (e) {
      Provider.of<CommonProvider>(context, listen: false).loading = false;
      log(e.error.toString());
      /*  Provider.of<CommonProvider>(context, listen: false)
          .userAlreadyExist(context); */
    }

    return '';
  }

  Future<Map<String, dynamic>> BookJob(
      BookJobRequestModel jobModel, BuildContext context) async {
    String path = ApiConfigration.baseUrl + ApiConfigration.bookJob;
    String? token = await getUserAccesToken();
    log("======================================addaddressmodel===address======${jobModel.address}");
    log("======================================addaddressmodel==date===========${jobModel.date}");
    log("======================================addaddressmodel===jobid========${jobModel.jobId}");
    log("======================================addaddressmodel===slots=========${jobModel.slots}");
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
      log("======================================bookjobresponse======${response.data}");
      /* Response response = await dio.post(path,
          data: jsonEncode(jobModel.toJson()),
          options: Options(headers: {"authorization": "Bearer $token"})); */

      if (response.statusCode == 200 || response.statusCode == 201) {
        log('_________________');
        // BookJobModel newbooking = response.data;

        return booking;
      }
    } on DioException catch (e) {
      Provider.of<CommonProvider>(context, listen: false).loading = false;
      log(e.error.toString());
      /*  Provider.of<CommonProvider>(context, listen: false)
          .userAlreadyExist(context); */
    }

    return booking;
  }
}

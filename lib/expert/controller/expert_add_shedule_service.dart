import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:skillmaestro/expert/model/expert_add_shedule_model.dart';

import '../../application/common/common_provider.dart';
import '../../core/api/api_configuration.dart';
import '../../core/theme/access_token/token.dart';
import 'package:intl/intl.dart';

class ExpertAddShedule {
  Dio dio = Dio();
  FlutterSecureStorage storage = const FlutterSecureStorage();

  Future<void> AddShedule(List<DateTime> schedule, BuildContext context) async {
    String path = ApiConfigration.baseUrl + ApiConfigration.addShedule;

    try {
      String? token = await getExpertAccesToken();

      List<dynamic> formattedSchedule = schedule.map((dateTime) {
        return DateFormat('yyyy-MM-ddTHH:mm:ss').format(dateTime.toUtc());
      }).toList();
      Map<String, dynamic> requestBody = {
        'dates': formattedSchedule,
      };

      /*  List<String> formattedSchedule = schedule.map((dateTime) {
      return DateFormat("yyyy-MM-dd HH:mm:ss").format(dateTime);
    }).toList(); */
      Response response = await dio.post(path,
          data: jsonEncode(requestBody),
          options: Options(headers: {"authorization": "Bearer $token"}));
      //log("==========+++++++++==============${response.data}");
      if (context.mounted) {
        Provider.of<CommonProvider>(context, listen: false).offLoading();
      }
      if (response.statusCode == 200 || response.statusCode == 201) {
        /* final ExpertSignInResModel responseData =
            ExpertSignInResModel.fromJson(response.data); */
        log("============expert addshedule controller=======${response.data}");
        return response.data;
      }
    } on DioException catch (e) {
      log(e.message.toString());
    }
  }

  Future<dynamic> GetShedule() async {
    String path = ApiConfigration.baseUrl + ApiConfigration.getSchedule;

    try {
      String? token = await getExpertAccesToken();

      Response response = await dio.get(path,
          options: Options(headers: {"authorization": "Bearer $token"}));
      //log("==========+++++++++==============${response.data}");
      /* if (context.mounted) {
        Provider.of<CommonProvider>(context, listen: false).offLoading();
      } */
      if (response.statusCode == 200 || response.statusCode == 201) {
        /* final ExpertSignInResModel responseData =
            ExpertSignInResModel.fromJson(response.data); */
        log("============expert getshedule controller=======${response.data}");
        return response.data;
      }
    } on DioException catch (e) {
      log(e.message.toString());
    }
  }
}

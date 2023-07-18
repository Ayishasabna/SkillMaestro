import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import '../../application/common/common_provider.dart';
import '../../core/api/api_configuration.dart';
import '../../core/theme/access_token/token.dart';
import 'package:intl/intl.dart';

class ExpertAddShedule {
  Dio dio = Dio();
  FlutterSecureStorage storage = const FlutterSecureStorage();

  // ignore: non_constant_identifier_names
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

      Response response = await dio.post(path,
          data: jsonEncode(requestBody),
          options: Options(headers: {"authorization": "Bearer $token"}));

      if (context.mounted) {
        Provider.of<CommonProvider>(context, listen: false).offLoading();
      }
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      }
    } on DioException catch (e) {
      log(e.message.toString());
    }
  }

  // ignore: non_constant_identifier_names
  Future<dynamic> GetShedule() async {
    String path = ApiConfigration.baseUrl + ApiConfigration.getSchedule;

    try {
      String? token = await getExpertAccesToken();

      Response response = await dio.get(path,
          options: Options(headers: {"authorization": "Bearer $token"}));

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      }
    } on DioException catch (e) {
      log(e.message.toString());
    }
  }
}

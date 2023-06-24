import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../application/common/common_provider.dart';
import '../../core/api/api_configuration.dart';
import '../model/expert_sign_up_req_model.dart';

class ExpertSignUpApiService {
  Dio dio = Dio();
  Future<String> expertSignUp(
      ExpertSignUpModel expertSignUpModel, BuildContext context) async {
    String path = ApiConfigration.baseUrl + ApiConfigration.expertSignUp;

    try {
      Response response =
          await dio.post(path, data: jsonEncode(expertSignUpModel.toJson()));

      log(response.statusCode.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (context.mounted) {
          Provider.of<CommonProvider>(context, listen: false).loading = false;
          Provider.of<CommonProvider>(context, listen: false)
              .expertOtpSend(context);
        }
        return 'Success';
      } else {
        if (context.mounted) {
          Provider.of<CommonProvider>(context, listen: false).offLoading();
        }
      }
    } on DioException catch (e) {
      Provider.of<CommonProvider>(context, listen: false).loading = false;
      log(e.error.toString());
      Provider.of<CommonProvider>(context, listen: false)
          .userAlreadyExist(context);
    }

    return '';
  }
}

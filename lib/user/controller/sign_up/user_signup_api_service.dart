import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../application/common/common_provider.dart';
import '../../../core/api/api_configuration.dart';

import '../../model/authentication/user_sign_up_model.dart';

class UserSignUpApiService {
  Dio dio = Dio();
  Future<String> userSignUp(
      UserSignUpModel userSignUpModel, BuildContext context) async {
    String path = ApiConfigration.baseUrl + ApiConfigration.signUp;

    try {
      Response response =
          await dio.post(path, data: jsonEncode(userSignUpModel.toJson()));

      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        if (context.mounted) {
          Provider.of<CommonProvider>(context, listen: false).loading = false;
          Provider.of<CommonProvider>(context, listen: false)
              .userOtpSend(context);
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

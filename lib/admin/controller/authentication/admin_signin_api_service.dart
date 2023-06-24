import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../application/common/common_provider.dart';
import '../../../core/api/api_configuration.dart';
import '../../model/admin_sign_in_req_model.dart';
import '../../model/admin_sign_in_resp_model.dart';

class AdminSignInApiService {
  Dio dio = Dio();

  Future<AdminSignInResModel?> adminSignIn(
      AdminSignInReqModel adminSignInReqModel, BuildContext context) async {
    String path = ApiConfigration.baseUrl + ApiConfigration.admin;

    try {
      Response response =
          await dio.post(path, data: jsonEncode(adminSignInReqModel.toJson()));
      if (context.mounted) {
        Provider.of<CommonProvider>(context, listen: false).offLoading();
      }
      if (response.statusCode == 200 || response.statusCode == 201) {
        final AdminSignInResModel responseData =
            AdminSignInResModel.fromJson(response.data);

        return responseData;
      }
    } on DioException catch (e) {
      log(e.message.toString());
    }
    return null;
  }
}

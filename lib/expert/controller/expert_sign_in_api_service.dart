import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:skillmaestro/core/theme/access_token/token.dart';
import 'package:skillmaestro/expert/model/expert_sign_in_resp_model.dart';
import '../../core/api/api_configuration.dart';
import '../model/expert_sign_in_req_model.dart';

class ExpertSignInApiService {
  Dio dio = Dio();
  FlutterSecureStorage storage = const FlutterSecureStorage();

  // ignore: non_constant_identifier_names
  Future<ExpertSignInResModel?> ExpertSignIn(
      ExpertSignInReqModel expertSignInReqModel, BuildContext context) async {
    String path = ApiConfigration.baseUrl + ApiConfigration.expertSignIn;

    try {
      Response response = await dio.post(
        path,
        data: jsonEncode(expertSignInReqModel.toJson()),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final ExpertSignInResModel responseData =
            ExpertSignInResModel.fromJson(response.data);

        final data = response.data['result'];
        final name = data['username'];
        final id = data['_id'];
        await storage.write(key: 'currentExpertName', value: name);
        await storage.write(key: 'currentExpertId', value: id);

        await storage.write(
            key: 'expert_access_token', value: responseData.experttoken);

        return responseData;
      }
    } on DioException catch (e) {
      log(e.message.toString());
    }

    return null;
  }
}

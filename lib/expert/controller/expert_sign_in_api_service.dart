import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:skillmaestro/expert/model/expert_sign_in_resp_model.dart';

import '../../application/common/common_provider.dart';
import '../../core/api/api_configuration.dart';
import '../model/expert_sign_in_req_model.dart';

class ExpertSignInApiService {
  Dio dio = Dio();
  FlutterSecureStorage storage = const FlutterSecureStorage();

  Future<ExpertSignInResModel?> ExpertSignIn(
      ExpertSignInReqModel expertSignInReqModel, BuildContext context) async {
    String path = ApiConfigration.baseUrl + ApiConfigration.expertSignIn;
    try {
      Response response =
          await dio.post(path, data: jsonEncode(expertSignInReqModel.toJson()));
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (context.mounted) {
          Provider.of<CommonProvider>(context, listen: false).offLoading();
        }
        final ExpertSignInResModel returnsignInExpertResModel =
            ExpertSignInResModel.fromJson(response.data);

        final data = response.data['data']['user'];
        final id = data['_id'];
        final name = data['username'];
        await storage.write(key: 'currentExpertName', value: name);

        await storage.write(key: 'currentExpertId', value: id);
        return returnsignInExpertResModel;
      }
    } on DioException catch (e) {
      Provider.of<CommonProvider>(context, listen: false).userNotExist(context);
      log(e.message.toString(), name: 'error');
    }
    return null;
  }
}

import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

import '../../../../application/common/common_provider.dart';
import '../../../../core/api/api_configuration.dart';
import '../../../model/authentication/user_sign_in_req_model.dart';
import '../../../model/authentication/user_sign_in_response_model.dart';

class UserSignInApiService {
  Dio dio = Dio();
  FlutterSecureStorage storage = const FlutterSecureStorage();

  Future<UserSignInResModel?> userSignIn(
      UserSignInReqModel userSignInReqModel, BuildContext context) async {
    String path = ApiConfigration.baseUrl + ApiConfigration.signin;
    try {
      // ignore: unused_local_variable
      UserSignInReqModel signInReqModel = userSignInReqModel;

      Response response = await dio.post(path,
          data: jsonEncode(userSignInReqModel.toJson()),
          options: Options(headers: {"Content-Type": "application/json"}));

      if (response.statusCode == 200 || response.statusCode == 201) {
        if (context.mounted) {
          Provider.of<CommonProvider>(context, listen: false).offLoading();
        }

        UserSignInResModel signInResModel =
            UserSignInResModel.fromJson(response.data);

        final data = response.data['result'];
        final name = data['username'];
        final id = data['_id'];

        await storage.write(key: 'currentUserName', value: name);

        await storage.write(key: 'currentUserId', value: id);
        await storage.write(
            key: 'user_access_token', value: response.data['token']);

        return signInResModel;
      }
    } on DioException catch (e) {
      Provider.of<CommonProvider>(context, listen: false).userNotExist(context);
      log(e.message.toString(), name: 'error');
    }
    return null;
  }
}



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
      Response response =
          await dio.post(path, data: jsonEncode(userSignInReqModel.toJson()));
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (context.mounted) {
          Provider.of<CommonProvider>(context, listen: false).offLoading();
        }
        final UserSignInResModel returnsignInResModel =
            UserSignInResModel.fromJson(response.data);

        final data = response.data['data']['user'];
        final id = data['_id'];
        final name = data['fullName'];
        await storage.write(key: 'currentUserName', value: name);

        await storage.write(key: 'currentUserId', value: id);
        return returnsignInResModel;
      }
    } on DioException catch (e) {
      Provider.of<CommonProvider>(context, listen: false).userNotExist(context);
      log(e.message.toString(), name: 'error');
    }
    return null;
  }
}

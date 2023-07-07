import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:skillmaestro/core/theme/access_token/token.dart';

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
      log('hjsjfhkdhkdjh');
      UserSignInReqModel signInReqModel = userSignInReqModel;
      log('-----------------------signreqmodel===========${signInReqModel.mobile}+++++++++${signInReqModel.password}');
      Response response = await dio.post(path,
          data: jsonEncode(userSignInReqModel.toJson()),
          options: Options(headers: {"Content-Type": "application/json"}));
      log('==============response=====${response.data}');
      if (response.statusCode == 200 || response.statusCode == 201) {
        log('(((((((((((((((((((((((${response.data})))))))))))))))))))))))');
        if (context.mounted) {
          Provider.of<CommonProvider>(context, listen: false).offLoading();
        }

        /* final UserSignInResModel returnsignInResModel =
            UserSignInResModel.fromJson(response.data); */
        UserSignInResModel signInResModel =
            UserSignInResModel.fromJson(response.data);

        //log('(((((((((((((((((((((((${signInResModel.result})))))))))))))))))))))))');
        final data = response.data['result'];
        final name = data['username'];
        final id = data['_id'];
        log("_______________________user sign in _____________$data");
        //log("+++++++++++++++++++++++++++++$name");
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

/* class UserSignInApiService {
  Dio dio = Dio();
  FlutterSecureStorage storage = const FlutterSecureStorage();

  Future<UserSignInResModel?> userSignIn(
      UserSignInReqModel userSignInReqModel, BuildContext context) async {
    String path = ApiConfigration.baseUrl + ApiConfigration.signin;

    try {
      //String? token = await getUserAccesToken();
      Response response = await dio.post(
        path,
        data: jsonEncode(userSignInReqModel.toJson()),
        //options: Options(headers: {"authorization": "Bearer $token"})
      );
      log("==========+++++++++==============${response.data}");
      /* if (context.mounted) {
        Provider.of<CommonProvider>(context, listen: false).offLoading();
      } */
      if (response.statusCode == 200 || response.statusCode == 201) {
        final UserSignInResModel responseData =
            UserSignInResModel.fromJson(response.data);
        log("============user responsedata controller=======${responseData}");
        return responseData;
      }
    } on DioException catch (e) {
      log(e.message.toString());
    }

    return null;
  }


} */

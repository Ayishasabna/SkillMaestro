import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import '../../../application/common/common_provider.dart';
import '../../../core/api/api_configuration.dart';
import '../../model/authentication/user_sign_up_res.dart';
import '../../model/authentication/user_verify_otp.dart';

class UserOtpVerifyApiService {
  Dio dio = Dio();
  FlutterSecureStorage storage = const FlutterSecureStorage();
  Future<UserSignUpResModel?> userOtpVerification(
      UserOtpVerifyModel otpdata, context) async {
    String path = ApiConfigration.baseUrl + ApiConfigration.verifyOtp;

    try {
      log('inside try ');
      log("${otpdata.otp}");
      log("otpdata:-------${otpdata.mobile}");
      Response response =
          await dio.post(path, data: jsonEncode(otpdata.toJson()));
      log("verifyotp  ::::${response.data}");
      log(response.statusCode.toString());
      if (response.statusCode == 401) {
        Provider.of<CommonProvider>(context, listen: false).offLoading();
        log(response.statusCode.toString());
        Provider.of<CommonProvider>(context, listen: false)
            .showInvalidOtpSnack(context);
        return null;
      } else if (response.statusCode == 200 || response.statusCode == 201) {
        Provider.of<CommonProvider>(context, listen: false).offLoading();
        await storeCurrentDetails(response);
        log('success');
        Provider.of<CommonProvider>(context, listen: false)
            .showSuccessSnackBar(context);

        /* final ExpertSignUpResModel verificationResponse =
            ExpertSignUpResModel.fromJson(response.data); */
        final UserSignUpResModel returnsignUpResModel =
            UserSignUpResModel.fromJson(response.data);

        log(returnsignUpResModel.token);
        log("responseData:::::;${response.data}");
        return returnsignUpResModel;
      }

      /* else if (response.statusCode == 200 || response.statusCode == 201) {
        log("ResponseData    ::::::${response.data}");
        Provider.of<CommonProvider>(context, listen: false).offLoading();
        await storeCurrentDetails(response);
        if (response.data['token'] != null) {
          Provider.of<CommonProvider>(context, listen: false)
              .showSuccessSnackBar(context);
          log(response.data['token']);
          final UserSignUpResModel returnsignUpResModel =
              UserSignUpResModel.fromJson(response.data);
          log(returnsignUpResModel.token);
          return returnsignUpResModel;
        }

        return null;
      } */

      /* else if (response.statusCode == 200 || response.statusCode == 201) {
        Provider.of<CommonProvider>(context, listen: false).offLoading();
        log("ResponseData    ::::::${response.data}");
        //await storeCurrentDetails(response);
        final responseData = response.data;
        /* if (response.data['token'] != null) {
          Provider.of<CommonProvider>(context, listen: false)
              .showSuccessSnackBar(context);
          log(response.data['token']);
          final UserSignUpResModel returnsignUpResModel =
              UserSignUpResModel.fromJson(response.data);
          log(returnsignUpResModel.token);
          return returnsignUpResModel;
        } */

        if (responseData['token'] != null && responseData['result'] != null) {
          Provider.of<CommonProvider>(context, listen: false)
              .showSuccessSnackBar(context);
          log(responseData['token']);

          final UserSignUpResModel returnsignUpResModel =
              UserSignUpResModel.fromJson(responseData);
          log(returnsignUpResModel.token);

          // Extract user details from response
          final userResult = responseData['result'];
          final id = userResult['_id'];
          final username = userResult['username'];

          // Store user details
          await storage.write(key: 'currentUserName', value: username);
          await storage.write(key: 'currentUserId', value: id);

          return returnsignUpResModel;
        }

        return null;
      } */
    } on DioException catch (e) {
      Provider.of<CommonProvider>(context, listen: false).offLoading();
      Provider.of<CommonProvider>(context, listen: false)
          .showInvalidOtpSnack(context);
      log(e.message.toString());
    }
    return null;
  }

  storeCurrentDetails(Response response) async {
    final userSignUpResModel = UserSignUpResModel.fromJson(response.data);

    final user = userSignUpResModel.result;
    final id = user.id;
    final username = user.username;

    await storage.write(key: 'currentUserName', value: username);
    await storage.write(key: 'currentUserId', value: id);
  }

  /*  storeCurrentDetails(Response response) async {
    final data = response.data['token'];
    if (data != null && data['result'] != null) {
      final id = data['result']['_id'];
      final username = data['result']['username'];
      await storage.write(key: 'currentUserName', value: username);
      await storage.write(key: 'currentUserId', value: id);
    }
  } */
}

import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:skillmaestro/expert/model/expert_otp_verify_model.dart';
import 'package:skillmaestro/expert/model/expert_verify_otp_model.dart';
import '../../application/common/common_provider.dart';
import '../../core/api/api_configuration.dart';
import '../model/expert_sign_up_resp_model.dart';

class ExpertOtpVerifyApiService {
  Dio dio = Dio();
  FlutterSecureStorage storage = const FlutterSecureStorage();

  Future<ExpertSignUpResModel?> expertOtpVerification(
      ExpertOtpVerifyModel otp, context) async {
    String path = ApiConfigration.baseUrl + ApiConfigration.verifyExpertOtp;

    try {
      log('inside try');
      Response response = await dio.post(path, data: jsonEncode(otp.toJson()));

      if (response.statusCode == 401 || response.statusMessage == 'failed') {
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
        final ExpertSignUpResModel returnsignUpResModel =
            ExpertSignUpResModel.fromJson(response.data);

        log(returnsignUpResModel.expertToken);
        log("responseData:::::;${response.data}");
        return returnsignUpResModel;
      }
    } on DioException catch (e) {
      Provider.of<CommonProvider>(context, listen: false)
          .showInvalidOtpSnack(context);
      log(e.message.toString());
    }
    return null;
  }

  storeCurrentDetails(Response response) async {
    final expertSignUpResModel = ExpertSignUpResModel.fromJson(response.data);

    final user = expertSignUpResModel.result;
    final id = user.id;
    final name = user.username;

    await storage.write(key: 'currentExpertName', value: name);
    await storage.write(key: 'currentExpertId', value: id);
  }

  /* storeCurrentDetails(Response response) async {
    final data = response.data['data']['user'];
    final id = data['_id'];
    final name = data['fullName'];
    await storage.write(key: 'currentUserName', value: name);
    await storage.write(key: 'currentUserId', value: id);
  } */
}





/* class ExpertOtpVerifyApiService {
  Dio dio = Dio();
  FlutterSecureStorage storage = const FlutterSecureStorage();
  Future<ExpertSignUpResModel?> expertOtpVerification(
      ExpertOtpVerifyModel otp, context) async {
    String path = ApiConfigration.baseUrl + ApiConfigration.verifyExpertOtp;

    try {
      log('inside try ');
      log("${otp.otp}");
      //log("${otp.mobile}");
      Response response = await dio.post(path, data: jsonEncode(otp.toJson()));
      log(response.statusCode.toString());
      if (response.statusCode == 401) {
        Provider.of<CommonProvider>(context, listen: false).offLoading();
        log(response.statusCode.toString());
        Provider.of<CommonProvider>(context, listen: false)
            .showInvalidOtpSnack(context);
        return null;
      } else if (response.statusCode == 200 || response.statusCode == 201) {
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

          final ExpertSignUpResModel returnExpertsignUpResModel =
              ExpertSignUpResModel.fromJson(responseData);
          log(returnExpertsignUpResModel.token);

          // Extract user details from response
          final expertResult = responseData['result'];
          final id = expertResult['_id'];
          final username = expertResult['username'];

          // Store user details
          await storage.write(key: 'currentExpertName', value: username);
          await storage.write(key: 'currentExpertId', value: id);

          return returnExpertsignUpResModel;
        }

        return null;
      }
    } on DioException catch (e) {
      Provider.of<CommonProvider>(context, listen: false).offLoading();
      Provider.of<CommonProvider>(context, listen: false)
          .showInvalidOtpSnack(context);
      log(e.message.toString());
    }
    return null;
  }

  /* storeCurrentDetails(Response response) async {
    final data = response.data['token']['result'];
    final id = data['_id'];
    final username = data['username'];
    await storage.write(key: 'currentUserName', value: username);
    await storage.write(key: 'currentUserId', value: id);
  } */

  storeCurrentDetails(Response response) async {
    final data = response.data['token'];
    if (data != null && data['result'] != null) {
      final id = data['result']['_id'];
      final expertname = data['result']['username'];
      await storage.write(key: 'currentExpertName', value: expertname);
      await storage.write(key: 'currentExpertId', value: id);
    }
  }
} */

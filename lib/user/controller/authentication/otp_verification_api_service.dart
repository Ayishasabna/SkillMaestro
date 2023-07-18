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
      Response response =
          await dio.post(path, data: jsonEncode(otpdata.toJson()));

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

        final UserSignUpResModel returnsignUpResModel =
            UserSignUpResModel.fromJson(response.data);

        return returnsignUpResModel;
      }
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

}

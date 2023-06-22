import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skillmaestro/user/view/login.dart';
import 'package:skillmaestro/user/view/otp_verification.dart';
import 'package:skillmaestro/user/view/user_home.dart';

import '../../core/constants.dart';
import '../../user/controller/authentication/otp_verification_api_service.dart';
import '../../user/controller/authentication/sign_in/sign_in_api_service.dart';
import '../../user/controller/sign_up/user_signup_api_service.dart';
import '../../user/model/authentication/user_sign_in_req_model.dart';
import '../../user/model/authentication/user_sign_up_model.dart';
import '../../user/model/authentication/user_sign_up_res.dart';
import '../../user/model/authentication/user_verify_otp.dart';

class UserProvider with ChangeNotifier {
  bool isLoading = false;
  bool isLoadingsignUp = false;
  bool isLoadingOtp = false;
  bool isOtpValidator = true;
  FlutterSecureStorage storage = const FlutterSecureStorage();

  Future<void> checkUserSignIn(
      BuildContext context, mobileData, passwordData) async {
    isLoading = true;
    notifyListeners();
    final mobile = mobileData;
    final password = passwordData;
    final signInUserDatas =
        UserSignInReqModel(mobile: mobile, password: password);
    final tokenData =
        await UserSignInApiService().userSignIn(signInUserDatas, context);

    if (tokenData?.token != null) {
      log(tokenData!.token.toString(), name: "signInTokennnnnnnn");
      final sharedPref = await SharedPreferences.getInstance();
      await sharedPref.setBool(SAVE_KEY_NAME, true);
      await storage.write(
          key: "user_access_token", value: jsonEncode(tokenData.token));
      log("${tokenData.token}");
      // ignore: use_build_context_synchronously
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
        builder: (context) {
          return UserHome();
        },
      ), (route) => false);
      UserLogin();
    }
    isLoading = false;
    notifyListeners();
  }

// User Sign Up Method
  Future<void> signUPNewUser({
    context,
    username,
    email,
    mobile,
    password,
  }) async {
    isLoadingsignUp = true;
    notifyListeners();
    final signUpUserDatas = UserSignUpModel(
      username: username,
      email: email,
      mobile: mobile,
      password: password,
    );
    print(context);
    final signUpResult =
        await UserSignUpApiService().userSignUp(signUpUserDatas, context);

    if (signUpResult == 'Success') {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => UserOtpScreen(mobile: mobile),
          ));
    }
    isLoadingsignUp = false;
    notifyListeners();
  }

// User Otp Verification Method
  Future verifyUserOtp(context, otpNumber, mobile) async {
    isLoadingOtp = true;
    notifyListeners();
    final otp = UserOtpVerifyModel(mobile: mobile, otp: int.parse(otpNumber));
    log("otp:$otp");
    log("otp+mobile${otp.mobile}");
    UserSignUpResModel? tokenData =
        await UserOtpVerifyApiService().userOtpVerification(otp, context);

    log(tokenData.toString());
    if (tokenData != null) {
      await storage.write(
          key: 'user_access_token', value: jsonEncode(tokenData.token));
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
        builder: (context) {
          return UserLogin();
        },
      ), (route) => false);
    }
    isLoadingOtp = false;
    notifyListeners();
  }

  void changeValidatorState() {
    isOtpValidator = !isOtpValidator;
    notifyListeners();
  }
}

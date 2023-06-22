import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:skillmaestro/expert/model/expert_sign_in_req_model.dart';
import 'package:skillmaestro/expert/model/expert_sign_up_req_model.dart';
import 'package:skillmaestro/expert/view/expert_signin.dart';
import 'package:skillmaestro/user/view/login.dart';

import '../../expert/controller/expert_otp_verification_api_service.dart';
import '../../expert/controller/expert_sign_in_api_service.dart';
import '../../expert/controller/expert_sign_up_api_service.dart';
import '../../expert/model/expert_sign_up_resp_model.dart';
import '../../expert/model/expert_verify_otp_model.dart';
import '../../expert/view/expert_otp_verification_screen.dart';

import '../../user/view/user_home.dart';

class ExpertProvider with ChangeNotifier {
  bool isLoading = false;
  bool isLoadingsignUp = false;
  bool isLoadingOtp = false;
  bool isOtpValidator = true;
  FlutterSecureStorage storage = const FlutterSecureStorage();

  Future<void> checkExpertSignIn(
      BuildContext context, mobileData, passwordData) async {
    isLoading = true;
    notifyListeners();
    final mobile = mobileData;
    final password = passwordData;
    final signInExpertDatas =
        ExpertSignInReqModel(mobile: mobile, password: password);
    final tokenData =
        await ExpertSignInApiService().ExpertSignIn(signInExpertDatas, context);

    if (tokenData?.expertToken != null) {
      log(tokenData!.expertToken.toString(), name: "signInTokennnnnnnn");
      await storage.write(
          key: "expert_access_token", value: jsonEncode(tokenData.expertToken));

      // ignore: use_build_context_synchronously
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
        builder: (context) {
          return UserHome();
        },
      ), (route) => false);
      ExpertLogin();
    }
    isLoading = false;
    notifyListeners();
  }

// User Sign Up Method
  Future<void> signUPNewExpert({
    context,
    username,
    email,
    mobile,
    password,
  }) async {
    isLoadingsignUp = true;
    notifyListeners();
    final signUpExpertDatas = ExpertSignUpModel(
      username: username,
      email: email,
      mobile: mobile,
      password: password,
    );

    final signUpResult =
        await ExpertSignUpApiService().expertSignUp(signUpExpertDatas, context);

    if (signUpResult == 'Success') {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ExpertOtpScreen(
              mobile: mobile,
            ),
          ));
    }
    isLoadingsignUp = false;
    notifyListeners();
  }

  // expert Otp Verification Method
  Future<void> verifyExpertOtp(context, otpNumber, mobile) async {
    isLoadingOtp = true;
    notifyListeners();

    final otp = ExpertOtpVerifyModel(mobile: mobile, otp: otpNumber);

    ExpertSignUpResModel? tokenData =
        await ExpertOtpVerifyApiService().expertOtpVerification(otp, context);
    log(tokenData.toString());
    if (tokenData != null) {
      log(tokenData.expertToken);
      await storage.write(
          key: 'expert_access_token', value: jsonEncode(tokenData.expertToken));
      await storage.write(key: 'vendorId', value: tokenData.result.id);
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
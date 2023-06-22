import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../application/common/common_provider.dart';
import '../../core/api/api_configuration.dart';
import '../model/expert_sign_up_req_model.dart';

class ExpertSignUpApiService {
  Dio dio = Dio();
  Future<String> expertSignUp(
      ExpertSignUpModel expertSignUpModel, BuildContext context) async {
    String path = ApiConfigration.baseUrl + ApiConfigration.expertSignUp;

    try {
      Response response =
          await dio.post(path, data: jsonEncode(expertSignUpModel.toJson()));

      log(response.statusCode.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (context.mounted) {
          Provider.of<CommonProvider>(context, listen: false).loading = false;
          Provider.of<CommonProvider>(context, listen: false)
              .expertOtpSend(context);
        }
        return 'Success';
      } else {
        if (context.mounted) {
          Provider.of<CommonProvider>(context, listen: false).offLoading();
        }
      }
    } on DioException catch (e) {
      Provider.of<CommonProvider>(context, listen: false).loading = false;
      log(e.error.toString());
      Provider.of<CommonProvider>(context, listen: false)
          .userAlreadyExist(context);
    }

    return '';
  }

  /* Future otpsend(String mobile) async {
    String path1 =
        "https://verify.twilio.com/v2/Services/VA4207740a915c795a6960b2579a5dd25d/Verifications";
    String path2 = "/To=+919746048135";
    String path3 = "/Channel=sms";
    String path4 =
        "AC97b0619a8f6deb53563c95a193d44a27:b42c18813f76996d5449308469117ddd";

    String path = path1 + path2 + path3 + path4;
    print(path);

    try {
      Response response = await dio.post(path,
          data: jsonEncode(
              expertOtpModel(mobile: mobile, channel: 'sms').toJson()));
      print('twilliohhvhvhvhvhvhvh');
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        /* if (context.mounted) {
          Provider.of<CommonProvider>(context, listen: false).loading = false;
          Provider.of<CommonProvider>(context, listen: false)
              .userOtpSend(context);
        }
        return 'Success';
      } else {
        if (context.mounted) {
          Provider.of<CommonProvider>(context, listen: false).offLoading();
        }
      }
    } on DioException catch (e) {
      Provider.of<CommonProvider>(context, listen: false).loading = false;
      log(e.error.toString());
      Provider.of<CommonProvider>(context, listen: false)
          .userAlreadyExist(context);
    }
 */

        return '';
      }
    } catch (e) {
      log(e.toString());
    }
  } */
}

import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../application/common/common_provider.dart';
import '../../../core/api/api_configuration.dart';
import '../../model/authentication/otp_model.dart';
import '../../model/authentication/user_sign_up_model.dart';

class UserSignUpApiService {
  Dio dio = Dio();
  Future<String> userSignUp(
      UserSignUpModel userSignUpModel, BuildContext context) async {
    String path = ApiConfigration.baseUrl + ApiConfigration.signUp;

    try {
      Response response =
          await dio.post(path, data: jsonEncode(userSignUpModel.toJson()));

      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        if (context.mounted) {
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
              UserOtpModel(mobile: mobile, channel: 'sms').toJson()));
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

  /* otpsend() {
  final url = 'https://api.example.com/endpoint';
  final accountSid = 'YOUR_TWILIO_SID';
  final authToken = 'YOUR_TWILIO_AUTH_TOKEN';
  final headers = {
    'Authorization': 'Basic ' + base64Encode(utf8.encode('$accountSid:$authToken')),
  };
  final body = {'key1': 'value1', 'key2': 'value2'};

  http.post(Uri.parse(url), headers: headers, body: body).then((response) {
    if (response.statusCode == 200) {
      // Request successful, handle the response
      print('Response: ${response.body}');
    } else {
      // Request failed, handle the error
      print('Error: ${response.statusCode}');
    }
  }).catchError((error) {
    // Error occurred during the request
    print('Error: $error');
  });
} */
}

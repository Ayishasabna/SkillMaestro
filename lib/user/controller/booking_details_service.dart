import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:skillmaestro/core/theme/access_token/token.dart';

import '../../core/api/api_configuration.dart';
import '../model/decline_estimation_model.dart';

class UserBookingDetailsService {
  Dio dio = Dio();
  FlutterSecureStorage storage = const FlutterSecureStorage();
  Future approveEstimate(
    String id,
  ) async {
    String path =
        ApiConfigration.baseUrl + ApiConfigration.approveEstimate + '/${id}';

    try {
      String? token = await getUserAccesToken();
      Response response = await dio.get(path,
          options: Options(headers: {"authorization": "Bearer $token"}));

      if (response.statusCode == 200 || response.statusCode == 201) {
        log('__________approveestimateresponse data_________${response.data}');
        // final ExpertSignInResModel responseData =
        //     ExpertSignInResModel.fromJson(response.data);
      }
    } on DioException catch (e) {
      log(e.message.toString());
    }

    return null;
  }

  Future declineEstimate(DeclineEstimationModel model) async {
    String path = ApiConfigration.baseUrl + ApiConfigration.decline;

    try {
      String? token = await getUserAccesToken();
      Response response = await dio.post(path,
          data: model.toJson(),
          options: Options(headers: {"authorization": "Bearer $token"}));

      if (response.statusCode == 200 || response.statusCode == 201) {
        log('__________decline stimateresponse data_________${response.data}');
        // final ExpertSignInResModel responseData =
        //     ExpertSignInResModel.fromJson(response.data);
      }
    } on DioException catch (e) {
      log(e.message.toString());
    }

    return null;
  }
}

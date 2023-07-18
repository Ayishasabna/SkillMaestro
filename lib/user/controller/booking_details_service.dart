import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:skillmaestro/core/theme/access_token/token.dart';
import 'package:skillmaestro/user/model/cancel_booking_model.dart';

import '../../core/api/api_configuration.dart';
import '../model/decline_estimation_model.dart';

class UserBookingDetailsService {
  Dio dio = Dio();
  FlutterSecureStorage storage = const FlutterSecureStorage();
  Future approveEstimate(
    String id,
  ) async {
    String path =
        // ignore: prefer_interpolation_to_compose_strings
        ApiConfigration.baseUrl + ApiConfigration.approveEstimate + '/$id';

    try {
      String? token = await getUserAccesToken();
      Response response = await dio.get(path,
          options: Options(headers: {"authorization": "Bearer $token"}));

      if (response.statusCode == 200 || response.statusCode == 201) {
        
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
       
      }
    } on DioException catch (e) {
      log(e.message.toString());
    }

    return null;
  }

  Future cancelBooking(CancelBookingModel model) async {
    String path = ApiConfigration.baseUrl + ApiConfigration.cancelBooking;

    try {
      String? token = await getUserAccesToken();
      Response response = await dio.post(path,
          data: model.toJson(),
          options: Options(headers: {"authorization": "Bearer $token"}));

      if (response.statusCode == 200 || response.statusCode == 201) {
        
      }
    } on DioException catch (e) {
      log(e.message.toString());
    }

    return null;
  }
}

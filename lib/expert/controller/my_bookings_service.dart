import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:skillmaestro/expert/model/booking_reponse_model.dart';

import '../../core/api/api_configuration.dart';
import '../../core/theme/access_token/token.dart';

class MyBookings {
  Dio dio = Dio();
  //late GetBooking booking;
  Map<String, dynamic> job = {};
  Map<String, dynamic> bookings = {};
  Future<Map<String, dynamic>> getAllBookings() async {
    String path = ApiConfigration.baseUrl + ApiConfigration.myBookings;

    String? token = await getExpertAccesToken();
    log('=====================experttoken============$token');
    try {
      Response response = await dio.get(path,
          options: Options(headers: {"authorization": "Bearer $token"}));
      //log("========================responsebooking============${response.data}");
      if (response.statusCode == 200) {
        bookings = response.data;
        log('======booking details=======${bookings['result']}');

        return bookings;
      }
    } catch (e) {}
    return bookings;
  }
}

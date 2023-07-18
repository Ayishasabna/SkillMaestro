import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:skillmaestro/core/theme/access_token/token.dart';

import '../../core/api/api_configuration.dart';

//await UserBookings().getAllUserBookings();

class UserBookings {
  Dio dio = Dio();
  //late GetBooking booking;
  Map<String, dynamic> job = {};
  Map<String, dynamic> bookings = {};
  Future<Map<String, dynamic>> getAllUserBookings() async {
    String path = ApiConfigration.baseUrl + ApiConfigration.userBookings;

    String? token = await getUserAccesToken();
    //log('=====================experttoken============$token');
    try {
      Response response = await dio.get(path,
          options: Options(headers: {"authorization": "Bearer $token"}));
      //log("========================responsebooking============${response.data}");
      if (response.statusCode == 200) {
        bookings = response.data;
        //log('======booking details user=======${bookings['result']}');

        return bookings;
      }
    } catch (e) {}
    return bookings;
  }
}

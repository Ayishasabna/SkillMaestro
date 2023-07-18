import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:skillmaestro/core/theme/access_token/token.dart';
import '../../core/api/api_configuration.dart';

class UserBookings {
  Dio dio = Dio();
  //late GetBooking booking;
  Map<String, dynamic> job = {};
  Map<String, dynamic> bookings = {};
  Future<Map<String, dynamic>> getAllUserBookings() async {
    String path = ApiConfigration.baseUrl + ApiConfigration.userBookings;

    String? token = await getUserAccesToken();
    
    try {
      Response response = await dio.get(path,
          options: Options(headers: {"authorization": "Bearer $token"}));
      
      if (response.statusCode == 200) {
        bookings = response.data;
        
        return bookings;
      }
    } catch (e) {
      log(e.toString());
    }
    return bookings;
  }
}

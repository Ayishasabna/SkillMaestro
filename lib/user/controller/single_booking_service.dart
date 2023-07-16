import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:provider/provider.dart';

import '../../application/common/common_provider.dart';
import '../../core/api/api_configuration.dart';
import '../../core/theme/access_token/token.dart';

import '../model/single_booking_details_response_model.dart';

class ShowSingleBookingService {
  Dio dio = Dio();
  Map<String, dynamic> singleBookingDetails = {};
  Future<Map<String, dynamic>> fetchBooking(bookingId, context) async {
    String path =
        ApiConfigration.baseUrl + ApiConfigration.singleBooking + '/$bookingId';

    String? token = await getUserAccesToken();
    try {
      Response response = await dio.get(path,
          options: Options(headers: {"authorization": "Bearer $token"}));
      if (response.statusCode == 200) {
        Provider.of<CommonProvider>(context, listen: false)
            .setShimmerLoading(false);

        //var jsonResponse = jsonDecode(jsonEncode(response.data['result']));
        // var singleBookingDetails =
        //     ShowSingleBookingDetailsModel.fromJson(jsonResponse);
        singleBookingDetails = response.data['result'];
        //log("______________response.data.toString()____________${singleBookingDetails}");
        return singleBookingDetails;
      }
    } on DioException catch (e) {
      log(e.message.toString());
    }
    return singleBookingDetails;
  }
}

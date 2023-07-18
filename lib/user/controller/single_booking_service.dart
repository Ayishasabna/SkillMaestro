import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import '../../application/common/common_provider.dart';
import '../../core/api/api_configuration.dart';
import '../../core/theme/access_token/token.dart';

class ShowSingleBookingService {
  Dio dio = Dio();
  Map<String, dynamic> singleBookingDetails = {};
  Future<Map<String, dynamic>> fetchBooking(bookingId, context) async {
    String path =
        // ignore: prefer_interpolation_to_compose_strings
        ApiConfigration.baseUrl + ApiConfigration.singleBooking + '/$bookingId';

    String? token = await getUserAccesToken();
    try {
      Response response = await dio.get(path,
          options: Options(headers: {"authorization": "Bearer $token"}));
      if (response.statusCode == 200) {
        Provider.of<CommonProvider>(context, listen: false)
            .setShimmerLoading(false);

        
        singleBookingDetails = response.data['result'];
        
        return singleBookingDetails;
      }
    } on DioException catch (e) {
      log(e.message.toString());
    }
    return singleBookingDetails;
  }
}

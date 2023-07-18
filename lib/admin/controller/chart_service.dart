import 'dart:developer';
import 'package:dio/dio.dart';
import '../../core/api/api_configuration.dart';
import '../../core/theme/access_token/token.dart';

class ChartDataService {
  Dio dio = Dio();

  Map<String, dynamic> experts = {};
  Future<Map<String, dynamic>> getChartData() async {
    String path = ApiConfigration.baseUrl +
        ApiConfigration.admin +
        ApiConfigration.getChartData;

    String? token = await getAdminAccesToken();
    try {
      Response response = await dio.get(path,
          options: Options(headers: {"authorization": "Bearer $token"}));

      if (response.statusCode == 201) {
        experts = response.data;

        return experts;
      }
    } catch (e) {
      log(e.toString());
    }
    return experts;
  }
}

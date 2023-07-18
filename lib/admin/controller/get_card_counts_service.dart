import 'dart:developer';
import 'package:dio/dio.dart';
import '../../core/api/api_configuration.dart';
import '../../core/theme/access_token/token.dart';

// ignore: camel_case_types
class getCardCounts {
  Dio dio = Dio();

  Map<String, dynamic> experts = {};
  Map<String, dynamic> cardcount = {};

  Future<Map<String, dynamic>> getCardcounts() async {
    String path = ApiConfigration.baseUrl +
        ApiConfigration.admin +
        ApiConfigration.getCardCounts;

    String? token = await getAdminAccesToken();
    try {
      Response response = await dio.get(path,
          options: Options(headers: {"authorization": "Bearer $token"}));

      if (response.statusCode == 201) {
        cardcount = response.data;

        return cardcount;
      }
    } catch (e) {
      log(e.toString());
    }
    return cardcount;
  }
}

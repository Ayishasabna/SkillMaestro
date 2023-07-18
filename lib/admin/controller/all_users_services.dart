import 'dart:developer';
import 'package:dio/dio.dart';
import '../../core/api/api_configuration.dart';
import '../../core/theme/access_token/token.dart';

class FetchAllUsersDetails {
  Dio dio = Dio();
  Map<String, dynamic> users = {};
  Future<Map<String, dynamic>> fetchAllUsersDetails() async {
    String path = ApiConfigration.baseUrl +
        ApiConfigration.admin +
        ApiConfigration.getUsers;

    String? token = await getAdminAccesToken();
    try {
      Response response = await dio.get(path,
          options: Options(headers: {"authorization": "Bearer $token"}));

      if (response.statusCode == 200) {
        users = response.data;

        return users;
      }
    } catch (e) {
      log(e.toString());
    }
    return users;
  }
}
 
import 'dart:developer';
import 'package:dio/dio.dart';
import '../../core/api/api_configuration.dart';
import '../../core/theme/access_token/token.dart';

class BlockUserService {
  Dio dio = Dio();
  Map<String, dynamic> users = {};
  Future<Map<String, dynamic>> blockUserId(id) async {
    // ignore: prefer_interpolation_to_compose_strings
    String path = ApiConfigration.baseUrl +
        ApiConfigration.admin +
        ApiConfigration.blockUser +
        "/$id";

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

  Future<Map<String, dynamic>> unBlockUserId(id) async {
    // ignore: prefer_interpolation_to_compose_strings
    String path = ApiConfigration.baseUrl +
        ApiConfigration.admin +
        ApiConfigration.unBlockUser +
        "/$id";

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

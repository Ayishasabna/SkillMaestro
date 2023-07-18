import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:skillmaestro/core/theme/access_token/token.dart';
import '../../core/api/api_configuration.dart';

class GetcontactsService {
  Dio dio = Dio();
  Map<String, dynamic> contacts = {};
  Map<String, dynamic> users = {};
  //Map<String, dynamic> booking = {};
  Future<Map<String, dynamic>> getContacts() async {
    String path = ApiConfigration.baseUrl + ApiConfigration.getExpertContacts;

    String? token = await getUserAccesToken();

    try {
      Response response = await dio.get(path,
          options: Options(headers: {"authorization": "Bearer $token"}));

      if (response.statusCode == 200) {
        contacts = response.data;
        return contacts;
      }
    } catch (e) {
      log(e.toString());
    }
    return contacts;
  }

  Future<Map<String, dynamic>> getUserContacts() async {
    String path = ApiConfigration.baseUrl + ApiConfigration.getUserContacts;

    String? token = await getExpertAccesToken();

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

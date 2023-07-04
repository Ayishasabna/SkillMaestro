import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:skillmaestro/core/theme/access_token/token.dart';

import '../../core/api/api_configuration.dart';

class GetcontactsService {
  Dio dio = Dio();
  Map<String, dynamic> contacts = {};
  //Map<String, dynamic> booking = {};
  Future<Map<String, dynamic>> getContacts() async {
    String path = ApiConfigration.baseUrl + ApiConfigration.getContacts;

    String? token = await getUserAccesToken();
    log('======(((((((((((((((((((((((contacts=======$token');
    try {
      Response response = await dio.get(path,
          options: Options(headers: {"authorization": "Bearer $token"}));

      if (response.statusCode == 200) {
        contacts = response.data;
        log('======(((((((((((((((((((((((contacts=======${contacts}');

        return contacts;
      }
    } catch (e) {}
    return contacts;
  }
}

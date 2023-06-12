import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../model/add_job_req_model.dart';

class AddJobService {
  Dio dio = Dio();

  Future<void> addJob(AddJobReqModel newJobName) async {
    /*  String path = ApiConfigration.kBaseUrl +
        ApiConfigration.admin +
        ApiConfigration.addCategory; */
    String path = 'http:/ 10.4.1.200:4000/admin/addjobs';

    FlutterSecureStorage storage = const FlutterSecureStorage();
    String? token = await storage.read(key: 'admin_access_token');
    String? tokenData = token!.replaceAll('"', '');
    log(tokenData);
    try {
      Response response = await dio.post(path,
          data: jsonEncode(newJobName.toJson()),
          options: Options(headers: {"authorization": "Bearer $tokenData"}));
      log(response.data.toString());
    } on DioException catch (e) {
      log(e.message.toString());
    }
  }
}

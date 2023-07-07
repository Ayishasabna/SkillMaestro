import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:skillmaestro/core/theme/access_token/token.dart';

import '../../core/api/api_configuration.dart';
import '../../user/model/chat/get_message_model.dart';
import '../../user/model/chat/send_message_model.dart';

class MessageUserService {
  Dio dio = Dio();
  FlutterSecureStorage storage = const FlutterSecureStorage();
  Future<List<GetMessageModel>?> getMessageUserService(String usertId) async {
    String? path = ApiConfigration.baseUrl + ApiConfigration.expertGetMessage;
    String? token = await getExpertAccesToken();
    String? id = await getCurrentExpertId();

    try {
      final option = Options(headers: {'Authorization': 'bearer $token'});
      Response response = await dio.post(path,
          data: {"from": id, "to": usertId},
          //queryParameters: {'to': selectedId}
          options: option);

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        final result = data.map((e) => GetMessageModel.fromJson(e)).toList();
        return result;
      }
    } catch (e) {
      log(e.toString(), name: 'getMessageError');
    }
    return null;
  }

  Future<void> sendMessageService(SendMessageModel model) async {
    String? token = await getExpertAccesToken();
    String path = ApiConfigration.baseUrl + ApiConfigration.expertAddMessage;
    try {
      final option = Options(headers: {'Authorization': 'bearer $token'});
      Response response = await dio.post(path,
          data: jsonEncode(model.toJson()), options: option);
      if (response.statusCode == 200) {
        //log("message send", name: 'sendMessageMS');
      }
    } catch (e) {
      log(e.toString(), name: 'sendMessageError');
    }
  }
}

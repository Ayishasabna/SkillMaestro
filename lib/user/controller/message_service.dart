import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:skillmaestro/core/api/api_configuration.dart';
import 'package:skillmaestro/core/theme/access_token/token.dart';

import '../model/chat/message_model.dart';

class MessageService {
  Dio dio = Dio();
  FlutterSecureStorage storage = const FlutterSecureStorage();
  Future<List<GetMessageModel>?> getMessageService(String selectedId) async {
    String? path = ApiConfigration.baseUrl + ApiConfigration.getMessage;
    String? token = await getUserAccesToken();
    log('================usertoken inside message controller=================${token}');
    try {
      final option = Options(headers: {'Authorization': 'bearer $token'});
      Response response = await dio.get(path,
          queryParameters: {'to': selectedId}, options: option);
      log('================response message=================${response}');
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

  /* Future<void> sendMessageService(SendMessageModel model) async {
    String? token = await storage.read(key: 'token');
    String path = kBaseurl + ApiEndPoints.chatting;
    try {
      final option = Options(headers: {'Authorization': 'bearer $token'});
      Response response = await dio.post(path,
          data: jsonEncode(model.toJson()), options: option);
      if (response.statusCode == 201) {
        log("message send", name: 'sendMessageMS');
      }
    } catch (e) {
      log(e.toString(), name: 'sendMessageError');
    }
  } */
}

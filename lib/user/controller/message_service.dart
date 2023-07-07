import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:skillmaestro/core/api/api_configuration.dart';
import 'package:skillmaestro/core/theme/access_token/token.dart';
import '../model/chat/get_message_model.dart';
import '../model/chat/send_message_model.dart';

class MessageService {
  Dio dio = Dio();
  FlutterSecureStorage storage = const FlutterSecureStorage();
  Future<List<GetMessageModel>?> getMessageService(String expertId) async {
    String? path = ApiConfigration.baseUrl + ApiConfigration.getMessage;
    String? token = await getUserAccesToken();
    String? id = await getCurrentUserId();

    try {
      final option = Options(headers: {'Authorization': 'bearer $token'});
      Response response = await dio.post(path,
          data: {"from": id, "to": expertId},
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
    String? token = await getUserAccesToken();
    String path = ApiConfigration.baseUrl + ApiConfigration.addMessage;
    try {
      final option = Options(headers: {'Authorization': 'bearer $token'});
      Response response = await dio.post(path,
          data: jsonEncode(model.toJson()), options: option);
      if (response.statusCode == 200) {
        log("message send", name: 'sendMessageMS');
      }
    } catch (e) {
      log(e.toString(), name: 'sendMessageError');
    }
  }
}

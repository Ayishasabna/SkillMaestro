import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:skillmaestro/core/theme/access_token/token.dart';
import '../../expert/controller/expert_message_service.dart';
import '../../user/model/chat/get_message_model.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import '../../user/model/chat/send_message_model.dart';

class MessagingExpertProvider with ChangeNotifier {
  List<GetMessageModel>? msgs = [];
  String? profilePhoto;
  String? userName;
  String? expertId;
  String? userId;
  IO.Socket? _socket;
  //String path = ApiConfigration.baseUrl;

  TextEditingController msgController = TextEditingController();
  //IO.Socket? socket;

  void clearDispose() {
    super.dispose();
    _socket?.disconnect();
    _socket?.emit('disconnect', userId);
  }

  void firstRunState({required String expertId}) {
    this.expertId = expertId;

    _connectSocket();
    getMessage();
  }

  _connectSocket() async {
    String id = await getCurrentExpertId();
    _socket = IO.io(
        'http://10.4.1.200:4000',
        IO.OptionBuilder().setTransports(['websocket']).setQuery(
                {'add-user': id}) // for Flutter or Dart VM
            .build());
    //_socket?._connectSocket();
    _socket?.emit('addUser', id);
    _socket?.onConnect((data) => print("connection established"));
    _socket?.onConnectError((data) => print("connection Error :$data"));
    _socket?.onDisconnect((data) => print("socket connection disconnected"));
    _socket?.on('msg-recieve', (data) {
      GetMessageModel model = GetMessageModel(
          fromSelf: false, message: data, createdAt: DateTime.now().toString());
      msgs!.add(model);
      notifyListeners();
    });
  }

  Future<void> getMessage() async {
    await MessageUserService()
        .getMessageUserService(expertId!)
        .then((value) => {
              msgs = value,
              notifyListeners(),
            });
  }

  void sendMessage(String msg, String userid) async {
    DateTime now = DateTime.now();
    String expertid = await getCurrentExpertId();

    GetMessageModel model = GetMessageModel(
        fromSelf: false, message: msg, createdAt: DateTime.now().toString());

    SendMessageModel sendModel = SendMessageModel(
        from: expertid, to: userid, message: msg, model: 'expert');

    msgs!.add(model);
    notifyListeners();

    _socket?.emit(
        "send-message", {"message": msg, "from": expertid, "to": userid});

    await MessageUserService().sendMessageService(sendModel);

    msgController.clear();
    notifyListeners();
  }

  dateChange(String date) {
    return date;
  }
}

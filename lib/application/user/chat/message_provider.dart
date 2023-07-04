import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:skillmaestro/core/api/api_configuration.dart';

import '../../../user/controller/message_service.dart';
import '../../../user/model/chat/message_model.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class MessagingUserProvider with ChangeNotifier {
  List<GetMessageModel>? msgs = [];
  String? profilePhoto;
  String? userName;
  String? selectedId;
  String? userId;
  //String path = ApiConfigration.baseUrl;

  TextEditingController msgController = TextEditingController();
  IO.Socket? socket;

  void clearDispose() {
    super.dispose();
    socket?.disconnect();
    socket?.emit('disconnect', userId);
  }

  void firstRunState({required String selectedId}) {
    log('================first Run State=================');
    this.selectedId = selectedId;
    connect();
    getMessage();
  }

  void connect() {
    log('================inside socket connect provider================');
    socket = IO.io('http://192.168.1.87:6000', <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
    });

    socket?.connect();

    log('__________=====================________________${socket?.connect().active}______============_______________');
    socket?.emit('addMessage', userId);

    socket?.on('msg-recieve', (data) {
      GetMessageModel model = GetMessageModel(
          myself: false, message: data, time: DateTime.now().toString());
      log('______________message___________${model.message}');
      msgs!.add(model);
      notifyListeners();
    });
  }

  Future<void> getMessage() async {
    await MessageService().getMessageService(selectedId!).then((value) => {
          msgs = value,
          notifyListeners(),
        });
  }

  void sendMessage(String msg) async {
    DateTime now = DateTime.now();

    GetMessageModel model = GetMessageModel(
        myself: true, message: msg, time: now.toIso8601String());
    //SendMessageModel sendModel = SendMessageModel(to: selectedId, message: msg);
    msgs!.add(model);
    notifyListeners();
    socket!.emit("send-msg",
        {"to": selectedId, "message": msg, "time": now.toIso8601String()});
    //await MessageService().sendMessageService(sendModel);
    msgController.clear();
    notifyListeners();
  }

  dateChange(String date) {
    DateTime dateTime = DateTime.parse(date);
    String time = DateFormat('h:mm a').format(dateTime);
    return time;
  }
}



/* import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../user/model/chat/message_model.dart';

class MessageProvider with ChangeNotifier {
  TextEditingController messageController = TextEditingController();

  Future<void> sendButtonClicked(
      {required String userId, required String chatRoomId}) async {
    if (messageController.text.isNotEmpty) {
      log('inside if');
      MessageModel messageModel = MessageModel(
          sendBy: userId,
          //createdOn: FieldValue.serverTimestamp(),
          seen: false,
          message: messageController.text);

      await FirebaseFirestore.instance
          .collection("chatRoom")
          .doc(chatRoomId)
          .collection("chats")
          .add(messageModel.tojson());
      messageController.clear();
    } else {
      log('Enter some Message');
    }
  }
}
 */
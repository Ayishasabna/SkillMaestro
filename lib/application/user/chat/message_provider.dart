import 'package:flutter/material.dart';
import '../../../core/api/api_configuration.dart';
import '../../../core/theme/access_token/token.dart';
import '../../../user/controller/message_service.dart';
import '../../../user/model/chat/get_message_model.dart';
// ignore: library_prefixes
import 'package:socket_io_client/socket_io_client.dart' as IO;
import '../../../user/model/chat/send_message_model.dart';

class MessagingUserProvider with ChangeNotifier {
  List<GetMessageModel>? msgs = [];

  String? selectedId;
  String? userId;
  late IO.Socket _socket;
  String path = ApiConfigration.baseUrl;

  TextEditingController msgController = TextEditingController();
  //IO.Socket? socket;

  void clearDispose() {
    super.dispose();
    _socket.disconnect();
    _socket.emit('disconnect', userId);
    notifyListeners();
  }

  void firstRunState({required String selectedId}) {
    this.selectedId = selectedId;
    connect();
    // _connectSocket();
    getMessage();
    notifyListeners();
  }

  void connect() async {
    String id = await getCurrentUserId();
    _socket = IO.io(path, <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
    });

    _socket.connect();
    _socket.emit('addUser', id);
    _socket.on('msg-recieve', (data) {
      GetMessageModel model = GetMessageModel(
          fromSelf: false, message: data, createdAt: DateTime.now().toString());
      msgs!.add(model);
      notifyListeners();
    });
    notifyListeners();
  }

  // ignore: unused_element
  _connectSocket() async {
    String id = await getCurrentUserId();
    _socket = IO.io(
        path,
        IO.OptionBuilder().setTransports(['websocket']).setQuery(
                {'add-user': id}) // for Flutter or Dart VM
            .build());
    _socket.emit('addUser', id);
    // ignore: avoid_print
    _socket.onConnect((data) => print("connection established"));
    // ignore: avoid_print
    _socket.onConnectError((data) => print("connection Error :$data"));
    // ignore: avoid_print
    _socket.onDisconnect((data) => print("socket connection disconnected"));
    _socket.on('msg-recieve', (data) {
      GetMessageModel model = GetMessageModel(
          fromSelf: true, message: data, createdAt: DateTime.now().toString());
      msgs!.add(model);
      notifyListeners();
    });
    notifyListeners();
  }

  Future<void> getMessage() async {
    await MessageService().getMessageService(selectedId!).then((value) => {
          msgs = value,
          notifyListeners(),
        });
    notifyListeners();
  }

  Future sendMessage(String msg, String expertid) async {
    // ignore: unused_local_variable
    DateTime now = DateTime.now();
    String userid = await getCurrentUserId();

    GetMessageModel model = GetMessageModel(
        fromSelf: false, message: msg, createdAt: DateTime.now().toString());

    SendMessageModel sendModel = SendMessageModel(
        from: userid, to: expertid, message: msg, model: 'user');

    msgs!.add(model);
    notifyListeners();
    _socket
        .emit("send-message", {"message": msg, "from": userid, "to": expertid});
    await MessageService().sendMessageService(sendModel);
    msgController.clear();
    notifyListeners();
  }

  dateChange(String date) {
    //DateTime tempDate = new DateFormat("yyyy-MM-dd hh:mm:ss").parse(date);

    return date;
  }
}

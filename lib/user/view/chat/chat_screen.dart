import 'dart:developer';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:skillmaestro/core/widgets/list_tile_widget.dart';
import 'package:skillmaestro/expert/model/all_booking_model.dart';
import 'package:skillmaestro/user/view/chat/chat_title.dart';
import 'package:skillmaestro/user/view/chat/message_screen.dart';

import '../../../application/user/chat/message_provider.dart';
import '../../model/add_message_model.dart';

String? selectedId;

class ChatScreen extends StatefulWidget {
  ChatScreen({super.key, required this.list});
  List<dynamic> list;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

Map<String, dynamic> user = {};

class _ChatScreenState extends State<ChatScreen> {
  List<ChatMessageModel> chatMessages = [];
  late expertOnlineStatus _expertonlineStatus;
  bool connectedToSocket = false;
  String connectMessage = 'Connecting.....';
  TextEditingController msginputController = TextEditingController();

  @override
  initState() {
    super.initState();
    _expertonlineStatus = expertOnlineStatus.connecting;
    connectedToSocket = false;
    user = list[0];
    context.read<MessagingUserProvider>().firstRunState(selectedId: user['id']);
    log('===============================chat screen============${user['id']}');

    //final provider = Provider.of<MessagingUserProvider>(context, listen: false);
    //log('================chat screen=================${provider.userName}');
    //provider.firstRunState(selectedId: selectedId!);
  }

  @override
  Widget build(BuildContext context) {
    user = list[0];
    return Scaffold(
      appBar: AppBar(
        title: ChatTitle(
            chatUser: user['username'],
            expertonlineStatus: _expertonlineStatus),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    itemCount: 10,
                    //chatMessages.length,
                    itemBuilder: (context, index) {
                      //ChatMessageModel chatmessagemodel = chatMessages[index];
                      //return Text(chatmessagemodel.message);
                      return MessageItem(
                        sentByMe: true,
                      );
                    })),
            bottomChatArea(),
          ],
        ),
      ),
    );
  }

  bottomChatArea() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          chatTextArea(),
          IconButton(
              onPressed: () {
                sendMessage(msginputController.text);
                msginputController.text = '';
              },
              icon: Icon(Icons.send))
        ],
      ),
    );
  }

  chatTextArea() {
    return Expanded(
        child: TextField(
      decoration: InputDecoration(
          enabledBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          focusedBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.all(10),
          hintText: 'Type Message'),
    ));
  }

  void sendMessage(String text) {}
}

class MessageItem extends StatelessWidget {
  MessageItem({super.key, required this.sentByMe});

  final bool sentByMe;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: sentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        color: sentByMe ? Colors.amber : Colors.grey,
        child: Row(
          children: [
            Text(
              'Hello',
              style: TextStyle(fontSize: 18),
            ),
            Text('2.00 pm')
          ],
        ),
      ),
    );
  }
}

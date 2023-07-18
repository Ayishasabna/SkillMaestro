import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skillmaestro/common/widgets/common_widget.dart';
import 'package:skillmaestro/core/constants.dart';
import 'package:skillmaestro/user/view/chat/chat_title.dart';
import '../../../application/user/chat/message_provider.dart';
import '../../../common/widgets/reply_card_widget.dart';
import '../../../common/widgets/send_card_widget.dart';
import '../../model/add_message_model.dart';

String? selectedId;

// ignore: must_be_immutable
class ChatScreen extends StatefulWidget {
  ChatScreen({super.key, required this.list});
  List<dynamic> list;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

Map<String, dynamic> expert = {};
bool isFromMe = true;
late ScrollController _chatListController;
//String userid = '';

class _ChatScreenState extends State<ChatScreen> {
  List<ChatMessageModel> chatMessages = [];
  late expertOnlineStatus _expertonlineStatus;
  //bool connectedToSocket = false;
  //String connectMessage = 'Connecting.....';
  TextEditingController msginputController = TextEditingController();

  @override
  initState() {
    super.initState();
    _expertonlineStatus = expertOnlineStatus.connecting;
    _chatListController = ScrollController(initialScrollOffset: 0);
    // connectedToSocket = false;
    expert = widget.list[0];
    chatListScrollToBottom();

    context
        .read<MessagingUserProvider>()
        .firstRunState(selectedId: expert['id']);
  }

  chatListScrollToBottom() {
    Timer(const Duration(microseconds: 100), () {
      if (_chatListController.hasClients) {
        _chatListController.animateTo(
            _chatListController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 100),
            curve: Curves.decelerate);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    context.read<MessagingUserProvider>().getMessage();
    expert = widget.list[0];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        title: ChatTitle(
            chatUser: expert['username'],
            expertonlineStatus: _expertonlineStatus),
      ),
      body: Consumer<MessagingUserProvider>(
        builder: (context, data, child) {
          // ignore: avoid_unnecessary_containers
          return Container(
            child: Column(
              children: [
                Expanded(
                  child: data.msgs!.isEmpty
                      ? const Center(child: Text("No messages"))
                      : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView.separated(
                            controller: _chatListController,
                            itemCount: data.msgs!.length,
                            // ignore: body_might_complete_normally_nullable
                            itemBuilder: (context, index) {
                              chatListScrollToBottom();
                              // ignore: unused_local_variable
                              bool fromMe = isFromMe;

                              if (data.msgs![index].fromSelf == true) {
                                String createdAtString =
                                    data.msgs![index].createdAt;

                                return sendCardWidget(
                                    context,
                                    data.msgs![index].message,
                                    createdAtString,
                                    true);
                              } else if (data.msgs![index].fromSelf == false) {
                                return replayCardWidget(
                                    context,
                                    data.msgs![index].message,
                                    DateTime.now().toString(),
                                    false);

                               
                              }
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return widgets().sizedboxHeight20();
                            },
                          ),
                        ),
                ),
                
                bottomChatArea(),
              ],
            ),
          );
        },
      ),
    );
  }

  bottomChatArea() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          chatTextArea(),
          IconButton(
              onPressed: () async {
                // ignore: await_only_futures
                await sendCardWidget(context, msginputController.text,
                    DateTime.now().toString(), true);

                sendMessage(
                  msginputController.text,
                  expert['id'],
                );
                msginputController.text = '';
              },
              icon: const Icon(Icons.send))
        ],
      ),
    );
  }

  chatTextArea() {
    return Expanded(
        child: TextField(
      controller: msginputController,
      decoration: InputDecoration(
          enabledBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          focusedBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.all(10),
          hintText: 'Type Message'),
    ));
  }

  void sendMessage(String text, String expertid) async {
    await context.read<MessagingUserProvider>().sendMessage(text, expertid);
    //context.read<MessagingUserProvider>().sendingMessage(text);
  }
}

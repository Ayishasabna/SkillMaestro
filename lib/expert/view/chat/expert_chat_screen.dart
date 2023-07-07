import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skillmaestro/core/constants.dart';
import 'package:skillmaestro/expert/view/chat/reply_card_widget.dart';
import 'package:skillmaestro/expert/view/chat/send_card_widget.dart';
import '../../../application/expert/expert_message_provider.dart';
import '../../../common/widgets/common_widget.dart';
import '../../../user/model/add_message_model.dart';
import '../../../user/view/chat/chat_title.dart';

String? selectedId;

// ignore: must_be_immutable
class ExpertChatScreen extends StatefulWidget {
  ExpertChatScreen({super.key, required this.list});
  List<dynamic> list;

  @override
  State<ExpertChatScreen> createState() => _ExpertChatScreenState();
}

Map<String, dynamic> user = {};
//String userid = '';

class _ExpertChatScreenState extends State<ExpertChatScreen> {
  List<ChatMessageModel> chatMessages = [];
  late expertOnlineStatus _useronlineStatus;
  bool connectedToSocket = false;
  String connectMessage = 'Connecting.....';
  TextEditingController msginputController = TextEditingController();
  ScrollController _scrollController = ScrollController();

  @override
  initState() {
    super.initState();
    _useronlineStatus = expertOnlineStatus.connecting;
    connectedToSocket = false;
    user = widget.list[0];

    context.read<MessagingExpertProvider>().firstRunState(expertId: user['id']);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Scroll to the last message after the layout is built
      _scrollToLastMessage();
    });
  }

  void _scrollToLastMessage() {
    if (_scrollController.hasClients && chatMessages.isNotEmpty) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    context.read<MessagingExpertProvider>().getMessage();
    //context.read<MessagingUserProvider>().getMessage();
    user = widget.list[0];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        title: ChatTitle(
            chatUser: user['username'], expertonlineStatus: _useronlineStatus),
      ),
      body: Consumer<MessagingExpertProvider>(
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
                            itemCount: data.msgs!.length,
                            // ignore: body_might_complete_normally_nullable
                            itemBuilder: (context, index) {
                              //final message = data.msgs![index];
                              if (data.msgs![index].fromSelf == true) {
                                String createdAtString =
                                    data.msgs![index].createdAt;
                                bool isSent = false;

                                return Align(
                                  alignment: Alignment.centerRight,
                                  child: ExpertsendCardWidget(
                                      context,
                                      data.msgs![index].message,
                                      createdAtString,
                                      isSent),
                                );
                              } else if (data.msgs![index].fromSelf == false) {
                                //final lastMessage = data.msgs!.last;
                                return Align(
                                  alignment: Alignment.centerLeft,
                                  child: ExpertreplayCardWidget(
                                    context,
                                    //lastMessage.message,
                                    data.msgs![index].message,
                                    DateTime.now().toString(),
                                  ),
                                );
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
              onPressed: () {
                sendMessage(
                  msginputController.text,
                  user['id'],
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

  void sendMessage(String text, String userid) {
    context.read<MessagingExpertProvider>().sendMessage(text, userid);
  }
}

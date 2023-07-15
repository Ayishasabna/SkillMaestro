import 'dart:async';
import 'dart:developer';
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

    //final provider = Provider.of<MessagingUserProvider>(context, listen: false);
    //log('================chat screen=================${provider.userName}');
    //provider.firstRunState(selectedId: selectedId!);
  }

  chatListScrollToBottom() {
    Timer(Duration(microseconds: 100), () {
      if (_chatListController.hasClients) {
        _chatListController.animateTo(
            _chatListController.position.maxScrollExtent,
            duration: Duration(milliseconds: 100),
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
          //List<GetMessageModel>? chatMessages = data.msgs;
          //log('______________value___________${chatMessages?.length}');
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
                            itemBuilder: (context, index) {
                              chatListScrollToBottom();
                              bool fromMe = isFromMe;

                              if (data.msgs![index].fromSelf == true) {
                                String createdAtString =
                                    data.msgs![index].createdAt;
                                //log('__________________created At_________${createdAtString}');

                                /* final timeRegex =
                                    RegExp(r'(\d{1,2}:\d{2}:\d{2}\s[ap]m)$');
                                final timeMatch =
                                    timeRegex.firstMatch(createdAtString);

                                if (timeMatch != null) {
                                  final time = timeMatch.group(1);
                                  print(time); // Output: 9:57:53 pm
                                } */
                                log('__________________created At_________${createdAtString}');
                                //DateTime dateTime = convertDateString(createdAtString);

                                /*  DateTime createdAt =
                                    DateFormat('M/d/yyyy,h:mm:ss a')
                                        .parse(createdAtString)
                                        .toLocal();

                                log('__________________created At++_________$createdAt'); */

                                /* DateTime createdAt =
                                    DateFormat('M/d/yyyy, h:mm:ss a')
                                        .parse(createdAtString);
                                log('__________________created At++_________${createdAt}'); */
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

                                //data.msgs![index].createdAt);
                              }
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return widgets().sizedboxHeight20();
                            },
                          ),
                        ),
                ),
                /* Expanded(
                    child: ListView.builder(
                        itemCount: //10,
                            chatMessages?.length,
                        itemBuilder: (context, index) {
                          ChatMessageModel chatmessagemodel =
                              chatMessages?[index] as ChatMessageModel;
                          return Text(chatmessagemodel.message);
                        })) */
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
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          chatTextArea(),
          IconButton(
              onPressed: () async {
                await sendCardWidget(context, msginputController.text,
                    DateTime.now().toString(), true);
                log("________________ msginputController.text,_________${msginputController.text}");
                sendMessage(
                  msginputController.text,
                  expert['id'],
                );
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
      controller: msginputController,
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

  void sendMessage(String text, String expertid) {
    context.read<MessagingUserProvider>().sendMessage(text, expertid);
    //context.read<MessagingUserProvider>().sendingMessage(text);
  }
}

import 'package:flutter/material.dart';
import 'package:skillmaestro/user/model/chat/send_message_model.dart';

class ChatContainer extends StatefulWidget {
  final dynamic data;
  final dynamic currentChat;
  final dynamic socket;
  final dynamic user;

  ChatContainer(
      {required this.data,
      required this.currentChat,
      required this.socket,
      required this.user});

  @override
  _ChatContainerState createState() => _ChatContainerState();
}

class _ChatContainerState extends State<ChatContainer> {
  List<Map<String, dynamic>> messages = [];
  TextEditingController messageController = TextEditingController();
  ScrollController scrollController = ScrollController();
  Map<String, dynamic>? arrivalMessage;

  @override
  void initState() {
    super.initState();
    if (widget.user != null) {
      /*  getUserMessage({'from': widget.data['_id'], 'to': widget.currentChat['id']}).then((response) {
        setState(() {
          messages = response.data;
        });
      }); */
    } else {
      /* getExpertMessage({'from': widget.data['_id'], 'to': widget.currentChat['id']}).then((response) {
        setState(() {
          messages = response.data;
        });
      }); */
    }

    if (widget.socket != null) {
      widget.socket.on('msg-recieve', (msg) {
        setState(() {
          arrivalMessage = {'fromSelf': false, 'message': msg};
        });
      });
    }
  }

  @override
  void dispose() {
    messageController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  Future<void> handleSendMsg(String msg) async {
    widget.socket.emit('send-message', {
      'to': widget.currentChat['id'],
      'from': widget.data['_id'],
      'msg': msg,
    });

    if (widget.user != null) {
      /* await addUserMessage({
        'from': widget.data['_id'],
        'to': widget.currentChat['id'],
        'message': msg,
        'model': 'user',
      }); */
    } else {
      /* await SendMessageModel({
        'from': widget.data['_id'],
        'to': widget.currentChat['id'],
        'message': msg,
        'model': 'expert',
      }); */
    }

    setState(() {
      messages.add({'fromSelf': true, 'message': msg});
    });

    messageController.clear();
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Container'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              itemCount: messages.length,
              itemBuilder: (BuildContext context, int index) {
                final message = messages[index];
                return ListTile(
                  title: Text(message['message']),
                  leading: message['fromSelf']
                      ? Icon(Icons.person)
                      : Icon(Icons.computer),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: InputDecoration(
                      hintText: 'Type a message',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () => handleSendMsg(messageController.text),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

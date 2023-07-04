/* import 'package:flutter/material.dart';

class ChatContainer extends StatefulWidget {
  final dynamic data;
  final dynamic currentChat;
  final dynamic socket;
  final dynamic user;

  const ChatContainer({
    Key? key,
    required this.data,
    required this.currentChat,
    required this.socket,
    required this.user,
  }) : super(key: key);

  @override
  _ChatContainerState createState() => _ChatContainerState();
}

class _ChatContainerState extends State<ChatContainer> {
  List<dynamic> messages = [];
  ScrollController scrollController = ScrollController();
  dynamic arrivalMessage;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    List<dynamic> response;
    if (widget.user != null) {
      response = await getUserMessage(
        {'from': widget.data['_id'], 'to': widget.currentChat['id']},
      );
    } else {
      response = await getExpertMessage(
        {'from': widget.data['_id'], 'to': widget.currentChat['id']},
      );
    }

    setState(() {
      messages = response;
    });
  }

  void handleSendMsg(String msg) async {
    widget.socket.current.emit('send-message', {
      'to': widget.currentChat['id'],
      'from': widget.data['_id'],
      'msg': msg,
    });

    if (widget.user != null) {
      await addUserMessage({
        'from': widget.data['_id'],
        'to': widget.currentChat['id'],
        'message': msg,
        'model': 'user',
      });
    } else {
      await addExpertMessage({
        'from': widget.data['_id'],
        'to': widget.currentChat['id'],
        'message': msg,
        'model': 'expert',
      });
    }

    setState(() {
      messages.add({'fromSelf': true, 'message': msg});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              itemCount: messages.length,
              itemBuilder: (BuildContext context, int index) {
                final message = messages[index];

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: message['fromSelf']
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.start,
                    children: [
                      if (!message['fromSelf'])
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                            message['fromSelf']
                                ? widget.data['image']
                                : widget.currentChat['image'],
                          ),
                        ),
                      Flexible(
                        child: Container(
                          padding: EdgeInsets.all(12.0),
                          margin: EdgeInsets.symmetric(horizontal: 8.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            color: message['fromSelf']
                                ? Colors.blue
                                : Colors.grey,
                          ),
                          child: Text(
                            message['message'],
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      if (message['createdAt'] != null)
                        Text(
                          'Sent@ ${message['createdAt'].split(',')[0]}\nTime@ ${message['createdAt'].split(',')[1]}',
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.grey,
                          ),
                        ),
                      if (message['createdAt'] == null)
                        Text()}
  }
}
 */
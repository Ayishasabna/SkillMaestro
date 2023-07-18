import 'package:flutter/material.dart';


// ignore: camel_case_types
enum expertOnlineStatus { connecting, online, offline }

class ChatTitle extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  ChatTitle(
      {super.key, required this.chatUser, required this.expertonlineStatus});

  final String chatUser;
  final expertOnlineStatus expertonlineStatus;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(chatUser),
          Text(
            getStatusText(),
            style: const TextStyle(fontSize: 14, color: Colors.white70),
          )
        ],
      ),
    );
  }

  getStatusText() {
    if (expertonlineStatus == expertOnlineStatus.online) {
      return 'online';
    }
    if (expertonlineStatus == expertOnlineStatus.offline) {
      return 'offline';
    }
    return 'Connecting....';
  }
}

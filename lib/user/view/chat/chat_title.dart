import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:skillmaestro/expert/model/all_booking_model.dart';

enum expertOnlineStatus { connecting, online, offline }

class ChatTitle extends StatelessWidget {
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
            style: TextStyle(fontSize: 14, color: Colors.white70),
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

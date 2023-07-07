import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../application/user/chat/message_provider.dart';
import '../../core/widgets/textstyle.dart';

Widget replayCardWidget(context, String msg, String time) {
  log("_____________reply card widget______________");
  return Column(
    children: [
      Align(
        alignment: Alignment.centerLeft,
        child: ConstrainedBox(
          constraints:
              BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(5)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    msg,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  TextStyleWidget(
                      title: Provider.of<MessagingUserProvider>(context,
                              listen: false)
                          .dateChange(time),
                      thick: FontWeight.w500,
                      textcolor: Colors.white12,
                      fontsize: 10)
                ],
              ),
            ),
          ),
        ),
      )
    ],
  );
}

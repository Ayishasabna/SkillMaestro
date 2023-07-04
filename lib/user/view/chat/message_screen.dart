import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skillmaestro/common/widgets/bottom_nav_bar.dart';
import 'package:skillmaestro/common/widgets/common_widget.dart';
import 'package:skillmaestro/core/constants.dart';
import 'package:skillmaestro/user/view/user_home.dart';

import '../../../application/user/chat/get_contacts_provider.dart';
import '../../../core/widgets/list_tile_widget.dart';
import '../../../core/widgets/textstyle.dart';

Map<String, dynamic> map = {};
List<dynamic> list = [];

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<GetContactsProvider>().getContactsExperts();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: mainColor,
        title: const TextStyleWidget(
          title: 'Chat',
          thick: FontWeight.bold,
          textcolor: Colors.white,
          fontsize: 24,
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => BottomNavBar()));
              },
              icon: Icon(Icons.close)),
          //notificationBtnIcon(context),
        ],
      ),
      backgroundColor: Colors.black12,
      body: Consumer<GetContactsProvider>(
        builder: (context, value, child) {
          //map = value.contacts['result'];
          list = value.contacts['result'];
          log('========================${list.length}');
          log('========================consumer====================${value.contacts['result']}');
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.separated(
              itemBuilder: (context, index) {
                return ListTileWidget(list: list);
              },
              separatorBuilder: (context, index) =>
                  widgets().sizedboxHeight10(),
              itemCount: list.length,
            ),
          );
        },
      ),
    );
  }
}

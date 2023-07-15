import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skillmaestro/application/expert/get_user_contacts_provider.dart';
import 'package:skillmaestro/expert/view/expert_bottom_nav_bar.dart';
import 'package:skillmaestro/expert/view/expert_home.dart';

import '../../../application/user/chat/get_contacts_provider.dart';
import '../../../common/widgets/common_widget.dart';
import '../../../core/constants.dart';
import '../../../core/widgets/expert_list_tile_widget.dart';
import '../../../core/widgets/list_tile_widget.dart';
import '../../../core/widgets/textstyle.dart';

Map<String, dynamic> map = {};
List<dynamic> list = [];

class ExpertMessageScreen extends StatelessWidget {
  const ExpertMessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<GetUserContactsProvider>().getContactsUser();
    //log("______________kkkkkk_______________________");
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
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => expertBottomNavBar()));
              },
              icon: Icon(Icons.close)),
          //notificationBtnIcon(context),
        ],
      ),
      backgroundColor: Colors.black12,
      body: Consumer<GetUserContactsProvider>(
        builder: (context, value, child) {
          //map = value.contacts['result'];
          list = value.users['result'];
          //log('========================${list.length}');
          //log('========================consumer====================${value.contacts['result']}');
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.separated(
              itemBuilder: (context, index) {
                return ExpertListTileWidget(list: list);
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

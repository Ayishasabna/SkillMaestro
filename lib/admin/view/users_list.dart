import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skillmaestro/admin/controller/block_user_service.dart';
import 'package:skillmaestro/application/admin/all_users_list_provider.dart';
import 'package:skillmaestro/application/admin/block_user_provider.dart';
import 'package:skillmaestro/core/constants.dart';

String userStatus = '';

class UsersList extends StatelessWidget {
  UsersList({super.key});
  //Map<String, dynamic> usersMap = {};

  @override
  Widget build(BuildContext context) {
    //Map<String, dynamic> usersMap= context.read<AllUsersListProvider>().fetchAllUsers();
    //context.read<BlockUserProvider>().toggleButtonText(result);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Map<String, dynamic> usersMap =
          await context.read<AllUsersListProvider>().fetchAllUsers();
      //String userStatus = usersMap['result'][2]['password'];
      //log("====userstatus=====$userStatus");
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Users"),
        backgroundColor: const Color(0xFF02D1AC),
        //backgroundColor: mainColor,
      ),
      body: Consumer<AllUsersListProvider>(builder: (context, value, child) {
        //log('------insideconsumer------${value.usersMap}');
        return value.usersMap.length == 0 || value.usersMap.isEmpty
            ? const Text("No Users available")
            : ListView.builder(
                itemCount: value.usersMap['result'].length,
                itemBuilder: (context, index) {
                  return UserCard(
                    map: value.usersMap['result'][index],
                    //map1: blockUser.unBlockeduser['result'],
                  );
                });
      }),
    );
  }
}

class UserCard extends StatelessWidget {
  UserCard({super.key, required this.map});
  Map<String, dynamic> map = {};
  Map<String, dynamic> userResult = {};

  //String map1;

  @override
  Widget build(BuildContext context) {
    //log("------blockedusercardbutton-----${map1}");
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0), // Adjust the value as needed
      ),
      elevation: 10,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'UserName:${map['username']}',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                ),
                Text('Email: ${map['email']}'),
                Text('Mobile: ${map['mobile']}'),
                Text('IsBanned:  ${map['isBanned']}'),
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber // Set the desired color here
                  ),
              onPressed: () {
                if (map['isBanned'] == false) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Block User'),
                        content: Text(
                            "Are You Sure You Want To BLock ${map['username']}}"),
                        actions: [
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("Cancel")),
                          ElevatedButton(
                              onPressed: () async {
                                // BlockUserService().blockUserId("${map['_id']}");
                                userResult = await context
                                    .read<BlockUserProvider>()
                                    .blockUser('${map['_id']}');
                                userStatus = await context
                                    .read<BlockUserProvider>()
                                    .toggleButtonText(userResult['result']);

                                Navigator.pop(context);
                              },
                              style: const ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll(Colors.green)),
                              child: const Text(
                                "Block",
                                style: TextStyle(color: Colors.white),
                              )),
                        ],
                      );
                    },
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('UnBlock User'),
                        content: Text(
                            "Are You Sure You Want To UnBLock ${map['username']}}"),
                        actions: [
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("Cancel")),
                          ElevatedButton(
                              onPressed: () async {
                                // BlockUserService().blockUserId("${map['_id']}");
                                userResult = await context
                                    .read<BlockUserProvider>()
                                    .unBlockUser('${map['_id']}');
                                userStatus = await context
                                    .read<BlockUserProvider>()
                                    .toggleButtonText(userResult['result']);

                                Navigator.pop(context);
                              },
                              style: const ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll(Colors.green)),
                              child: const Text(
                                "UnBlock",
                                style: TextStyle(color: Colors.white),
                              )),
                        ],
                      );
                    },
                  );
                }
              },
              child: Text("$userStatus"),
              /* child: Consumer<BlockUserProvider>(
                  builder: (context, value, child) {
                    log("---------blockconsumer------${value.unBlockeduser.length}");
                    String data = '';
                    if (value.unBlockeduser['isBanned'] == true) {
                      String data = "true";
                    } else
                      String data = "false";
                    return Text(data);
                    //Text(data);
                  },
                ) */
            ),
          ],
        ),
      ),
    );
  }
}

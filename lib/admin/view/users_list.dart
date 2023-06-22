import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skillmaestro/admin/controller/block_user_service.dart';
import 'package:skillmaestro/application/admin/all_users_list_provider.dart';
import 'package:skillmaestro/application/admin/block_user_provider.dart';
import 'package:skillmaestro/core/constants.dart';

class UsersList extends StatelessWidget {
  UsersList({super.key});
  //Map<String, dynamic> usersMap = {};

  @override
  Widget build(BuildContext context) {
    context.read<AllUsersListProvider>().fetchAllUsers();
    context.read<BlockUserProvider>();
    /*  WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<AllUsersListForAdmin>(context, listen: false).fetchAllUsers();
    }); */
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Users"),
        backgroundColor: const Color(0xFF02D1AC),
        //backgroundColor: mainColor,
      ),
      body: Consumer2<AllUsersListProvider, BlockUserProvider>(
          builder: (context, value, blockUser, child) {
        //log('------insideconsumer------${value.usersMap}');
        return value.usersMap.length == 0 || value.usersMap.isEmpty
            ? const Text("No Users available")
            : ListView.builder(
                itemCount: value.usersMap['result'].length,
                itemBuilder: (context, index) {
                  return UserCard(
                    map: value.usersMap['result'][index],
                    map1: blockUser.unBlockeduser['result'],
                  );
                });
      }),

      /* Consumer<AllUsersListForAdmin>(builder: (context, value, child) {
        if (value.usersList == null || value.usersList.isEmpty) {
          return const Text("No Users available");
        } else {
          return ListView.builder(
            itemBuilder: (context, index) => ListTile(
              onTap: () {
                log("-------------value.usersList[index]['username']${value.usersList[index]['username']}");
              },
              title: Text(value.usersList[index]['username']),

              //trailing: Text(value.allUsers![index]!.result[index].mobile),
              /* ElevatedButton(
                onPressed: () {
                  if (value.allUsers![index]!.result[index].isBanned == false) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Approve User'),
                          content: Text(
                              "Are You Sure You Want To Approve ${value.allUsers![index]!.result[index].username}"),
                          actions: [ */
              /*                ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("Cancel")),
                            /*  ElevatedButton(
                                onPressed: () {
                                  value.approveExpert(
                                      value.allExperts![index]!.id);

                                  Navigator.pop(context);
                                },
                                style: const ButtonStyle(
                                    backgroundColor:
                                        MaterialStatePropertyAll(Colors.green)),
                                child: const Text(
                                  "Approve",
                                  style: TextStyle(color: Colors.white),
                                )), */
                          ],
                        );
                      },
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Block User'),
                          content: Text(
                              "Are You Sure You Want To Block ${value.allUsers![index]!.result[index].username}"),
                          actions: [
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("Cancel")),
                            /*  ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  ExpertManagementService().blockExpert(context,
                                      value.allExperts![index]!.username);
                                },
                                child: const Text("Block")), */
                          ],
                        );
                      },
                    );
                  }
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        value.allUsers![index]!.result[index].isBanned == true
                            ? Colors.red
                            : Colors.green)),
                child: Text(
                  value.allUsers![index]!.result[index].isBanned.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
              ), */
              /* leading: value.allUsers![index]!.result[index].image != null
                  ? CircleAvatar(
                      backgroundImage: NetworkImage(
                        value.allUsers![index]!.result[index].image!,
                      ),
                    )
                  : const CircleAvatar(), */
            ),
            itemCount:
                //value.allUsers[index].result[index].length,
                value.usersList.length,
          );
        }
      }), */
    );
  }
}

class UserCard extends StatelessWidget {
  UserCard({super.key, required this.map, map1});
  Map<String, dynamic> map = {};
  String map1 =map1[0];

  @override
  Widget build(BuildContext context) {
    log("------blockedusercardbutton-----${map1}");
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
                if (map['isBanned'] == true) {
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
                              onPressed: () {
                                BlockUserService()
                                    .unBlockUserId("${map['_id']}");

                                /* context
                                    .read<BlockUserProvider>()
                                    .blockUser("${map['_id']}"); */

                                /*  context
                                    .read<BlockUserProvider>()
                                    .blockUser("${map['_id']}"); */

                                /* value.approveExpert(
                                    value.allExperts![index]!.id); */

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
                }
              },
              child: Text(''),
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

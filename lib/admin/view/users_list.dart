import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skillmaestro/application/admin/all_users_list_provider.dart';
import 'package:skillmaestro/application/admin/block_user_provider.dart';

String userStatus = '';

class UsersList extends StatelessWidget {
  const UsersList({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<AllUsersListProvider>().fetchAllUsers();
    
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("All Users"),
        backgroundColor: const Color(0xFF02D1AC),
        //backgroundColor: mainColor,
      ),
      body: Consumer<AllUsersListProvider>(builder: (context, value, child) {
        // ignore: prefer_is_empty
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

// ignore: must_be_immutable
class UserCard extends StatelessWidget {
  UserCard({super.key, required this.map});
  Map<String, dynamic> map = {};
  //bool userResult;

  //String map1;

  @override
  Widget build(BuildContext context) {
    Color color;
    bool userResult = map['isBanned'];
    if (map['isBanned'] == true) {
      userStatus = "Blocked";
      color = Colors.red;
    } else {
      userStatus = "Verified";
      color = Colors.amber;
    }
   
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0), // Adjust the value as needed
      ),
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'UserName:${map['username']}',
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 20),
                ),
                Text('Email: ${map['email']}'),
                Text('Mobile: ${map['mobile']}'),
                Text('IsBanned:  ${map['isBanned']}'),
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: color // Set the desired color here
                  ),
              onPressed: () {
                if (map['isBanned'] == false) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Center(child: Text('Block User')),
                        content: Text(
                          "Are You Sure You Want To BLock ${map['username']}",
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.blue),
                        ),
                        actions: [
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("Cancel")),
                          ElevatedButton(
                              onPressed: () async {
                                // BlockUserService().blockUserId("${map['_id']}");
                                await context
                                    .read<BlockUserProvider>()
                                    .blockUser('${map['_id']}');
                                // ignore: use_build_context_synchronously
                                userStatus = await context
                                    .read<BlockUserProvider>()
                                    //.toggleButtonText('${map['_id']}', context);
                                    .toggleButtonText(userResult);

                                // ignore: use_build_context_synchronously
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
                        title: const Center(
                          child: Text('UnBlock User',
                              style: TextStyle(fontSize: 19)),
                        ),
                        content: Text(
                          "Are You Sure You Want To UnBLock ${map['username']}",
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.blue),
                        ),
                        actions: [
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("Cancel")),
                          ElevatedButton(
                              onPressed: () async {
                                // BlockUserService().blockUserId("${map['_id']}");
                                await context
                                    .read<BlockUserProvider>()
                                    .unBlockUser('${map['_id']}');
                                // ignore: use_build_context_synchronously
                                userStatus = await context
                                    .read<BlockUserProvider>()
                                    .toggleButtonText(userResult);

                                // ignore: use_build_context_synchronously
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
              child: Text(userStatus),
            ),
          ],
        ),
      ),
    );
  }
}

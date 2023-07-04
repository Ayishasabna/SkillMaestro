import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skillmaestro/common/widgets/common_widget.dart';

import '../../../application/user/chat/message_provider.dart';
import '../../../common/widgets/send_card_widget.dart';
import '../../../core/widgets/textstyle.dart';

class MessagingUser extends StatelessWidget {
  const MessagingUser({
    super.key,
    this.userName,
    this.selectedId,
    this.profilePhoto,
    this.userId,
  });
  final String? userName;
  final String? selectedId;
  final String? profilePhoto;
  final String? userId;
  @override
  Widget build(BuildContext context) {
    var time = DateTime.now();
    final size = MediaQuery.of(context).size;
    final provider = Provider.of<MessagingUserProvider>(context, listen: false);
    //log('================chat screen=================${provider.userName}');
    provider.firstRunState(selectedId: selectedId!);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        child: Consumer<MessagingUserProvider>(builder: (context, data, child) {
          return Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 50),
                width: double.infinity,
                height: size.height * .175,
                color: Colors.amber,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                    widgets().sizedboxHeight10(),
                    CircleAvatar(
                      radius: 25,
                      child: profilePhoto != 'null'
                          ? CircleAvatar(
                              radius: 25,
                              backgroundImage: FadeInImage.assetNetwork(
                                placeholder: 'assets/images/user.png',
                                image: profilePhoto!,
                                fit: BoxFit.fill,
                                fadeInDuration:
                                    const Duration(milliseconds: 500),
                              ).image)
                          : const CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.transparent,
                              backgroundImage:
                                  AssetImage("assets/images/user.png"),
                            ),
                    ),
                    widgets().sizedboxHeight10(),
                    TextStyleWidget(
                      fontsize: 22,
                      textcolor: Colors.white,
                      thick: FontWeight.bold,
                      title: userName!,
                    )
                  ],
                ),
              ),
              Expanded(
                child: data.msgs!.isEmpty
                    ? const Center(child: Text("No messages"))
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.separated(
                          itemCount: data.msgs!.length,
                          itemBuilder: (context, index) {
                            if (data.msgs![index].myself == true) {
                              return sendCardWidget(
                                  context,
                                  data.msgs![index].message!,
                                  data.msgs![index].time!);
                            } /* else {
                              return replayCardWidget(
                                  context,
                                  data.msgs![index].message!,
                                  data.msgs![index].time!);
                            } */
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return widgets().sizedboxHeight10();
                          },
                        ),
                      ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: data.msgController,
                  keyboardType: TextInputType.multiline,
                  style: const TextStyle(color: Color.fromARGB(255, 8, 8, 8)),
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(17),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide:
                              const BorderSide(width: 1, color: Colors.white)),
                      labelText: 'message',
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      labelStyle: const TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(255, 50, 103, 137),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: IconButton(
                          onPressed: () {
                            if (data.msgController.text.isNotEmpty) {
                              data.sendMessage(data.msgController.text);
                              data.msgController.clear();
                            }
                          },
                          icon: const Icon(
                            Icons.send,
                            size: 25,
                            color: Color.fromARGB(255, 6, 39, 66),
                          ),
                          splashColor: Colors.transparent,
                        ),
                      )),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}





/* 
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class UserChatScreen extends StatelessWidget {
  const UserChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<UserConnectionService>(context, listen: false)
          .userConnection();
      Provider.of<UserConnectionService>(context, listen: false).showList =
          Provider.of<UserConnectionService>(context, listen: false)
              .sortedUsers;
    });
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 223, 223, 221),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: mainColor,
        title: Text('Messages', style: headText),
      ),
      body: Column(
        children: [
          ColoredBox(
            color: const Color.fromARGB(255, 121, 216, 206),
            child: Padding(
                padding: const EdgeInsets.only(right: 13, left: 13, bottom: 5),
                child: Consumer<UserConnectionService>(
                  builder: (context, values, child) => CupertinoSearchTextField(
                    onChanged: (value) => values.filterChatList(value),
                    backgroundColor: Colors.white,
                  ),
                )),
          ),
          Expanded(
            child: Consumer<UserConnectionService>(
              builder: (context, value, child) => value.showList!=null
                  ? ListView.builder(
                      itemBuilder: (context, index) {
                        return
                             value.showList!.isEmpty?const Center(child:Text('Search Item Not Found!',style: TextStyle(color: Colors.black),)):
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Card(
                                  child: ListTile(
                                      onTap: () async {
                                        // value.connectionCount?[index].count = 0;
                                        String currentUserId =
                                            await getCurrentUserId();
                                        String currentUserName =
                                            await getCurrentUserName();
                            
                                        String chatRoomId = ChatMethods()
                                            .checkingId(
                                                vendorId:
                                                    value.showList![index].id!,
                                                currentUser: currentUserId);
                                        ChatingVendor chatingVendor =
                                            ChatingVendor(
                                                id: value.showList![index].id,
                                                vendorName: value
                                                    .showList![index]
                                                    .fullName);
                                        log(chatRoomId.toString(),
                                            name: "ChatROomId");
                                        if (context.mounted) {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    UserMessagesScreen(
                                                      chatindex: index,
                                                  chatRoomId: chatRoomId,
                                                  chatingVendor: chatingVendor,
                                                  currentUserId: currentUserId,
                                                  currentUserName:
                                                      currentUserName,
                                                  profilePic: value
                                                      .showList![index]
                                                      .profilePhoto,
                                                ),
                                              ));
                                        }
                                        Provider.of<VendorAllGigsFetching>(context,listen: false).fetchVendorAllGigs(value.sortedUsers![index].id!);
                                      },
                                      leading: value.showList![index]
                                                  .profilePhoto ==
                                              null
                                          ? const CircleAvatar(
                                              backgroundImage: AssetImage(
                                                  "assets/splash/unknown.jpg"))
                                          : CircleAvatar(
                                              backgroundImage: NetworkImage(value
                                                  .showList![index]
                                                  .profilePhoto!)),
                                      title: Text(
                                          value.showList![index].fullName ??
                                              "unknown"),
                                      // subtitle:
                                      //     Text("${value.showList![index].phone}"),
                                      // trailing:
                                      //     value.connectionCount?[index].count != 0
                                      //         ? CircleAvatar(
                                      //             radius: 9,
                                      //             child: Text(
                                      //               '${value.connectionCount?[index].count}',
                                      //               style: const TextStyle(
                                      //                   fontSize: 12),
                                      //             ),
                                      //           )
                                      //         : const SizedBox()
                                              )),
                            );
                        
                      },
                      itemCount: value.showList!.length,
                    )
                  : const Center(child: Text('Chat List Not Found!')),
            ),
          )
        ],
      ),
    );
  }
}
 */
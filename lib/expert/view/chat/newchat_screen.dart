
import 'package:flutter/material.dart';
// ignore: library_prefixes
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../../../user/controller/get_contacts_service.dart';

// ignore: must_be_immutable
class YourWidget extends StatefulWidget {
  YourWidget({super.key, required this.list});
  List<dynamic> list;
  @override
  // ignore: library_private_types_in_public_api
  _YourWidgetState createState() => _YourWidgetState();
}

class _YourWidgetState extends State<YourWidget> {
  late IO.Socket socket;
  late String currentUser;
  List<dynamic> contacts = [];
  dynamic currentChat;

  @override
  void initState() {
    super.initState();
    currentUser = widget.list[0];
    // Initialize the socket connection
    // if (currentUser != null) {
    //   socket = IO.io('http://10.4.1.200:4000');
    //   socket.emit('add-user', currentUser);
    // }
  }

  @override
  void dispose() {
    socket.disconnect();
    super.dispose();
  }

  Future getExpertContacts() async {
    await GetcontactsService().getContacts();
    // Implement your API call to get expert contacts
  }

  Future getUserContacts() async {
    await GetcontactsService().getUserContacts();
    // Implement your API call to get user contacts
  }

  void handleChatChange(dynamic chat) {
    setState(() {
      currentChat = chat;
    });
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body: FutureBuilder(
        // ignore: unnecessary_null_comparison
        future: currentUser != null ? getExpertContacts() : getUserContacts(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            // Get the contacts from the API response
            if (snapshot.data != null) {
              contacts = snapshot.data['result'];
            }
            return ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(contacts[index]['name']),
                  onTap: () => handleChatChange(contacts[index]),
                );
              },
            );
          }
        },
      ),
    );
  }
}

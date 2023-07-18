import 'package:flutter/material.dart';
import 'package:skillmaestro/core/widgets/textstyle.dart';
import 'package:skillmaestro/user/view/chat/chat_screen.dart';

Map<String, dynamic> map = {};

// ignore: must_be_immutable
class ListTileWidget extends StatelessWidget {
  ListTileWidget({super.key, required this.list});
  List<dynamic> list = [];

  @override
  Widget build(BuildContext context) {
    map = list[0];

    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => //ChatScreen(username: list[0]['username'])
                ChatScreen(list: list)));
      },
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Image.asset('assets/user.png'),
        ),
        title: TextStyleWidget(
          title: '${map['username']}'.toUpperCase(),
          thick: FontWeight.w600,
          textcolor: Colors.black,
          fontsize: 20,
        ),
        subtitle: Text(
          'Email:${map['email']}\nMobile:${map['mobile']}',
          style: const TextStyle(fontSize: 16),
        ),
        trailing: const Text(
          '2:00 pm',
          style: TextStyle(fontSize: 12),
        ),
      ),
    );
  }
}

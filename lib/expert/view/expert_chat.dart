// ignore: must_be_immutable
import 'package:flutter/material.dart';
import '../../core/constants.dart';

// ignore: must_be_immutable
class ExpertChatScrn extends StatelessWidget {
  ExpertChatScrn({super.key});

  dynamic vid;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 223, 223, 221),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: mainColor,
        title: const Text(
          'Messages',
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Image.asset('assets/chat.png')],
      ),
    );
  }
}

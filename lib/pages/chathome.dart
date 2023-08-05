import 'package:flutter/material.dart';
import 'package:wpclone/widget/ChatList.dart';
import 'contactpage.dart';

class ChatHome extends StatefulWidget {
  const ChatHome({Key? key}) : super(key: key);

  @override
  State<ChatHome> createState() => _ChatHomeState();
}

class _ChatHomeState extends State<ChatHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChatList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Contactpage()),
          );
        },
        child: const Icon(Icons.chat),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:wpclone/pages/callhome.dart';
import 'package:wpclone/pages/chathome.dart';
import 'package:wpclone/pages/statushome.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 18, 140, 126),
          title: const Text(
            'WhatsApp',
            style: TextStyle(letterSpacing: 1),
          ),
          elevation: 1,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.camera_alt_outlined),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {},
            ),
          ],
          bottom: const TabBar(
            labelColor: Colors.white,
            indicatorWeight: 3,
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            splashFactory: NoSplash.splashFactory,
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                text: 'CHATS',
              ),
              Tab(
                text: 'STATUS',
              ),
              Tab(
                text: 'CALLS',
              ),
            ],
          ),
        ),
        body: const TabBarView(children: <Widget>[
          ChatHome(),
          StatusHome(),
          CallHome(),
        ]),
      ),
    );
  }
}

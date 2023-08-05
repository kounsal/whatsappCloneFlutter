import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StatusHome extends StatefulWidget {
  const StatusHome({Key? key}) : super(key: key);

  @override
  State<StatusHome> createState() => _ChatHomeState();
}

class _ChatHomeState extends State<StatusHome> {
  List jsonData = [];

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/json/chat.json');
    final data = await json.decode(response);
    setState(() {
      jsonData = data["chats"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Center(
            child: Text('Status Home'),
          ),
          jsonData.isNotEmpty
              ? Expanded(
                  child: ListView.builder(
                    itemCount: jsonData.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: const EdgeInsets.all(10),
                        child: ListTile(
                          leading:
                              CircleAvatar(child: Text(jsonData[index]["id"])),
                          title: Text(jsonData[index]["sender"]),
                          subtitle: Text(jsonData[index]["message"]),
                          trailing: Text(jsonData[index]["time"]),
                        ),
                      );
                    },
                  ),
                )
              : const SizedBox()
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: readJson,
        child: Icon(Icons.edit),
      ),
    );
  }
}

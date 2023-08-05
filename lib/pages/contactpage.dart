import 'package:flutter/material.dart';

class Contactpage extends StatefulWidget {
  const Contactpage({Key? key}) : super(key: key);

  @override
  State<Contactpage> createState() => _ContactpageState();
}

class _ContactpageState extends State<Contactpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select Contact',
            ),
            Text(
              '0 contacts',
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: const Center(
        child: Text('Contact'),
      ),
    );
  }
}

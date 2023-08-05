import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wpclone/widget/chatarea.dart';

class ChatPage extends StatefulWidget {
  final int userid;
  const ChatPage({
    super.key,
    required this.userid,
  });

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextEditingController messageController = TextEditingController();
  StreamController controller = StreamController();
  ////
  final ScrollController _scrollcontroller = ScrollController();
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
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          elevation: 0,
          leading: Padding(
            padding: EdgeInsets.only(top: 10),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
                size: 25,
              ),
            ),
          ),
          title: Padding(
            padding: EdgeInsets.only(top: 5, left: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/images/${widget.userid}.jpg'),
                    radius: 20,
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Developer${widget.userid}',
                          style: const TextStyle(fontSize: 18),
                        ),
                        Text(
                          'Online',
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.white.withOpacity(0.7)),
                        ),
                      ],
                    )),
              ],
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(top: 10, right: 10),
              child: Icon(Icons.videocam),
            ),
            Padding(
                padding: EdgeInsets.only(top: 10, left: 10, right: 5),
                child: Icon(Icons.call)),
            Padding(
              padding: EdgeInsets.only(top: 10, left: 10, right: 10),
              child: PopupMenuButton(
                icon: const Icon(Icons.more_vert),
                itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                  const PopupMenuItem(child: Text('Delete Chat')),
                  PopupMenuItem(
                    child: MaterialButton(
                      onPressed: () {},
                      child: const Text('Leave Group'),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 10, left: 8, right: 8, bottom: 80),
            child: Column(
              children: [
                Container(
                  width: 300,
                  margin: EdgeInsets.only(bottom: 20),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Color(0xfffff3C2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    "Messages and Calls are end-to-end encrypted. No one outside of this chat, not even WhatsApp, can read or listen to them.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 12,
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                ListView.builder(
                    controller: _scrollcontroller,
                    shrinkWrap: true,
                    itemCount: jsonData.length,
                    itemBuilder: (context, index) {
                      return messec(index);
                    }),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: chatbottom(),
    );
  }

  chatbottom() {
    return Container(
      height: 65,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: [
                // ignore: prefer_const_constructors
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.emoji_emotions_outlined,
                    color: Colors.black38,
                    size: 30,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.47,
                  child: TextFormField(
                    controller: messageController,
                    decoration:
                        const InputDecoration(hintText: "Type a Message"),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                ),
                Transform.rotate(
                  angle: 2 / 3.1415,
                  child: IconButton(
                    icon: const Icon(
                      Icons.attach_file,
                      color: Colors.black38,
                      size: 25,
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (builder) => popmenu(),
                          backgroundColor: Colors.transparent);
                    },
                  ),
                ),

                const IconButton(
                  onPressed: null,
                  icon: Icon(
                    size: 25,
                    Icons.camera_alt,
                    color: Colors.black38,
                  ),
                )
              ],
            ),
          ),
          Container(
            width: 10,
          ),
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.teal,
            child: messageController.text.isNotEmpty
                ? IconButton(
                    onPressed: () {
                      sendmessage();
                    },
                    icon: const Icon(
                      Icons.send,
                      color: Colors.black38,
                    ),
                  )
                : const IconButton(
                    onPressed: null,
                    icon: Icon(
                      Icons.mic,
                      color: Colors.black38,
                    ),
                  ),
          )
        ],
      ),
    );
  }

  sendmessage() {
    if (messageController.text.isNotEmpty) {
      Map<String, dynamic> data = {
        "sender": "Amar",
        "message": messageController.text,
        "time": DateTime.now().millisecondsSinceEpoch,
      };

      // String filePath = 'assets/json/chat.json';
      setState(() {
        controller.add(data);
        // writeDataToJson(data, filePath);
        messageController.clear();
      });
    }
  }

  Widget popmenu() {
    return Container(
      height: 350,
      width: MediaQuery.of(context).size.width,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        margin: const EdgeInsets.all(18),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                iconcreation(
                    Icons.insert_drive_file, "Document", Colors.purple),
                iconcreation(Icons.camera_alt, "Camera", Colors.pinkAccent),
                iconcreation(
                    Icons.insert_photo, "Gallery", Colors.purpleAccent),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                iconcreation(Icons.headset, "Audio", Colors.orangeAccent),
                iconcreation(Icons.location_pin, "Location", Colors.green),
                iconcreation(
                    Icons.currency_rupee_sharp, "Payments", Colors.teal),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                iconcreation(Icons.person, "Contacts", Colors.blue),
                iconcreation(Icons.bar_chart, "Poll", Colors.teal),
                iconcreation(Icons.location_pin, "", Colors.transparent),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget iconcreation(IconData icon, String text, Color color) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: color,
          child: Icon(
            icon,
            size: 29,
            color: Colors.white,
          ),
        ),
        Text(text),
      ],
    );
  }

  messec(index) {
    return jsonData.isNotEmpty
        ? ChatArea(
            sender: jsonData[index]["sender"],
            message: jsonData[index]["message"],
            time: jsonData[index]["time"],
          )
        : const SizedBox();
  }
}

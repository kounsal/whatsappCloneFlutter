import 'package:flutter/material.dart';
import '../pages/chatpage.dart';

class ChatList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          children: [
            for (int i = 1; i < 10; i++)
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChatPage(userid: i)),
                  );
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: CircleAvatar(
                          backgroundImage: AssetImage('assets/images/$i.jpg'),
                          radius: 25,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Developer$i',
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              'Hii there',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Column(
                        children: [
                          const Text(
                            '12:00 PM',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff0fce5e)),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                              color: const Color(0xff0fce5e),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Center(
                              child: Text(
                                '1',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    ));
  }
}

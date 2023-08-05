import 'dart:async';

import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';

class ChatArea extends StatefulWidget {
  final String message;
  final String sender;
  final String time;
  const ChatArea({
    super.key,
    required this.message,
    required this.time,
    required this.sender,
  });

  @override
  State<ChatArea> createState() => _ChatAreaState();
}

class _ChatAreaState extends State<ChatArea> {
  StreamController controller = StreamController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.sender != "Amar"
            ? Padding(
                padding: EdgeInsets.only(right: 80, bottom: 10),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: ClipPath(
                    clipper: UpperNipMessageClipperTwo(MessageType.receive),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              top: 10, bottom: 10, left: 25, right: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                widget.message,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                widget.time,
                                style: const TextStyle(
                                  fontSize: 10,
                                  color: Colors.black,
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )

            // Sent Message

            : Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.only(top: 20, left: 80, bottom: 15),
                child: ClipPath(
                  clipper: UpperNipMessageClipperTwo(MessageType.send),
                  child: Container(
                      padding: const EdgeInsets.only(
                        top: 10,
                        bottom: 10,
                        left: 10,
                        right: 20,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xffe4fdca),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            widget.message,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                widget.time,
                                style: const TextStyle(
                                  fontSize: 10,
                                  color: Colors.black,
                                ),
                                textAlign: TextAlign.right,
                              ),
                              const Icon(
                                Icons.done_all,
                                size: 14,
                                color: Color.fromARGB(255, 54, 157, 216),
                              )
                            ],
                          )
                        ],
                      )),
                ),
              ),
      ],
    );
  }
}

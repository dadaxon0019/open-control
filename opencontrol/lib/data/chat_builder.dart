import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:opencontrol/data/chat_message.dart';

class ChatBuilder extends StatefulWidget {
  final List<ChatMessage> chatMessage;
  final TextEditingController controller;
  final ScrollController scrollController;
  const ChatBuilder(
      {super.key,
      required this.chatMessage,
      required this.controller,
      required this.scrollController});

  @override
  State<ChatBuilder> createState() => _ChatBuilderState();
}

class _ChatBuilderState extends State<ChatBuilder> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.builder(
        controller: widget.scrollController,
        itemCount: widget.chatMessage.length,
        padding: const EdgeInsets.symmetric(vertical: 10),
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        itemBuilder: (context, index) {
          return Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 3),
              child: Align(
                // alignment: (widget.chatMessage[index].messageType == "receiver"
                //     ? Alignment.topRight
                //     : Alignment.topLeft),
                child: widget.chatMessage[index].messageType == "sender"
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ChatBubble(
                            clipper:
                                ChatBubbleClipper3(type: BubbleType.sendBubble),
                            alignment: Alignment.bottomRight,
                            backGroundColor: Colors.blue,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  widget.chatMessage[index].messageContent,
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                Text(
                                  widget.chatMessage[index].time,
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    : ChatBubble(
                        clipper:
                            ChatBubbleClipper3(type: BubbleType.receiverBubble),
                        backGroundColor: Color(0xffE7E7ED),
                        child: Container(
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.7,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                widget.chatMessage[index].messageContent,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              Text(
                                widget.chatMessage[index].time,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ),
                      ),
              ));
        },
      ),
    );
  }
}

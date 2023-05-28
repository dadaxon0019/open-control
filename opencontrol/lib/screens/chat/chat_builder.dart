import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:opencontrol/data/chat_message.dart';
import 'package:opencontrol/widgets/url.dart';

class ChatBuilder extends StatefulWidget {
  final List<ChatMessage> chatMessage;
  final TextEditingController controller;
  final ScrollController scrollController;
  final GlobalKey? lastKey;
  const ChatBuilder(
      {super.key,
      required this.chatMessage,
      required this.controller,
      required this.scrollController,
      this.lastKey});

  @override
  State<ChatBuilder> createState() => _ChatBuilderState();
}

class _ChatBuilderState extends State<ChatBuilder> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        child: ListView.builder(
          controller: widget.scrollController,
          itemCount: widget.chatMessage.length,
          padding: const EdgeInsets.only(top: 110, bottom: 110),
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          itemBuilder: (context, index) {
            return Container(
              key: index == widget.chatMessage.length - 1
                  ? widget.lastKey
                  : null,
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 3),
              constraints: const BoxConstraints(
                maxWidth: 300,
              ),
              child: widget.chatMessage[index].messageType == "sender"
                  ? ChatBubble(
                      clipper: ChatBubbleClipper3(type: BubbleType.sendBubble),
                      alignment: Alignment.topRight,
                      backGroundColor: Theme.of(context).cardColor,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 3),
                        constraints: const BoxConstraints(
                          maxWidth: 300,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            RichTextView(
                              text: widget.chatMessage[index].messageContent,
                            ),
                            Text(
                              widget.chatMessage[index].time,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                    )
                  : ChatBubble(
                      clipper:
                          ChatBubbleClipper3(type: BubbleType.receiverBubble),
                      alignment: Alignment.bottomLeft,
                      backGroundColor: Theme.of(context).dividerColor,
                      child: Container(
                        constraints: const BoxConstraints(
                          maxWidth: 300,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            RichTextView(
                              text: widget.chatMessage[index].messageContent,
                            ),
                            Text(
                              widget.chatMessage[index].time,
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                          ],
                        ),
                      ),
                    ),
            );
          },
        ),
      ),
    );
  }
}

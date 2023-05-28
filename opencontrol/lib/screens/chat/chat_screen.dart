import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';
import 'package:opencontrol/constants/constants_colors.dart';
import 'package:opencontrol/data/chat_builder.dart';
import 'package:opencontrol/data/chat_message.dart';
import 'package:opencontrol/widgets/custom_textfield.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final List<ChatMessage> chatMessage = [];
  final GlobalKey lastKey = GlobalKey();
  final time = DateFormat('hh:mm').format(DateTime.now());

  void add() {
    setState(
      () {
        if (controller.text != '') {
          chatMessage.add(
            ChatMessage(
                time: time,
                messageContent: controller.text.toString(),
                messageType: 'receiver'),
          );
        }
      },
    );
    SchedulerBinding.instance.addPostFrameCallback((_) => scrollToEnd());
  }

  void scrollToEnd() async {
    await _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeOut);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: [
          Positioned(
            child: Container(
              decoration: gradientBG,
            ),
          ),
          ChatBuilder(
            lastKey: lastKey,
            chatMessage: chatMessage,
            controller: controller,
            scrollController: _scrollController,
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.topCenter,
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 9.0,
                    sigmaY: 9.0,
                  ),
                  child: Container(
                    height: 100,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .scaffoldBackgroundColor
                          .withAlpha(100),
                      border: Border(
                        bottom: BorderSide(
                            color: Theme.of(context).cardColor.withAlpha(40)),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset('assets/images/chat_user.png'),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Harper',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Active',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                      color: Theme.of(context).primaryColor),
                            ),
                          ],
                        ),
                        Expanded(child: Container()),
                        Image.asset(
                          'assets/icons/phone.png',
                          color: Theme.of(context).dividerColor,
                        ),
                        const SizedBox(width: 25),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              add();
                              scrollToEnd();
                            });
                          },
                          child: Image.asset(
                            'assets/icons/Vector.png',
                            color: Theme.of(context).dividerColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 9.0,
                  sigmaY: 9.0,
                ),
                child: Container(
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: Theme.of(context)
                        .scaffoldBackgroundColor
                        .withAlpha(100),
                    border: const Border(
                      bottom: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/images/Vector.png',
                        color: Theme.of(context).dividerColor,
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: CustomTextField(
                          bgColor: Theme.of(context).dividerColor,
                          hintText: 'Type your message',
                          controller: controller,
                        ),
                      ),
                      const SizedBox(width: 16),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            add();
                            scrollToEnd();
                          });
                        },
                        child: Image.asset(
                          'assets/images/send.png',
                          color: Theme.of(context).dividerColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

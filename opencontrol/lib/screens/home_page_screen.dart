import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:opencontrol/constants/constants_colors.dart';
import 'package:opencontrol/screens/chat_screen.dart';
import 'package:opencontrol/widgets/on_tap_scale_and_fade.dart';
import 'package:opencontrol/widgets/primary_card.dart';
import 'package:opencontrol/widgets/recent_user_card.dart';
import 'package:opencontrol/widgets/text_field_home_page_widget.dart';
import '../widgets/bottom_navigation.dart';
import '../widgets/active_user_card.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment(0, 0),
              end: Alignment(0, 2.5),
              colors: [
            homePageBackColor,
            homePageSecondColor,
          ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            SafeArea(
              minimum: const EdgeInsets.only(
                right: 30,
                left: 30,
                top: 30,
              ),
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Messages',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Expanded(child: Container()),
                          const Icon(
                            Icons.settings,
                            color: textPrimaryColor,
                            size: 25,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      const SizedBox(
                        height: 48,
                        child: TextFieldHomePage(),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const PrimaryCard(
                        text: 'Currently Active',
                        icon: Icons.ac_unit,
                      ),
                      const SizedBox(
                        height: 13,
                      ),
                      const ActiveUserCard(
                        name: 'Ethan',
                        image: NetworkImage(
                            'https://mrrk.ru/wp-content/uploads/2022/07/CUtAw2xa.jpg'),
                      ),
                      const SizedBox(
                        height: 26,
                      ),
                      const PrimaryCard(
                        text: 'Currently Active',
                        icon: Icons.ac_unit,
                      ),
                      const SizedBox(
                        height: 19,
                      ),
                      OnTapScaleAndFade(
                          lowerBound: 0.95,
                          child: RecentUserCard(
                            image: AssetImage(
                              'assets/images/user2.png',
                            ),
                            name: 'Alexander',
                            text: 'Hey, what`s up?',
                            time: '4 min',
                            countMessage: 5,
                          ),
                          onTap: () {
                            Route route = MaterialPageRoute(
                                builder: (context) => ChatScreen());
                            Navigator.push(context, route);
                          }),
                      SizedBox(
                        height: 10,
                      ),
                      OnTapScaleAndFade(
                          lowerBound: 0.95,
                          child: RecentUserCard(
                            image: AssetImage(
                              'assets/images/user2.png',
                            ),
                            name: 'Alexander',
                            text: 'Hey, what`s up?',
                            time: '4 min',
                            countMessage: 5,
                          ),
                          onTap: () {
                            Route route = MaterialPageRoute(
                                builder: (context) => ChatScreen());
                            Navigator.push(context, route);
                          }),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 9.0,
                      sigmaY: 9.0,
                    ),
                    child: BottomNavigation(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

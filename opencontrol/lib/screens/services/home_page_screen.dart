import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:opencontrol/constants/constants_colors.dart';
import 'package:opencontrol/widgets/on_tap_scale_and_fade.dart';
import 'package:opencontrol/widgets/primary_card.dart';
import 'package:opencontrol/screens/services/components/services_card_widget.dart';
import '../../widgets/bottom_navigation.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
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
          SafeArea(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Бизнес-Надзор',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 28,
                      ),
                      const PrimaryCard(
                        text: 'Запланированные встречи',
                        icon: Icons.ac_unit,
                      ),
                      const SizedBox(
                        height: 17,
                      ),
                      const Text(
                        'У вас нет запланированных встреч',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(128, 255, 255, 255),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: kGradientBoxDecoration,
                        child: Padding(
                          padding: const EdgeInsets.all(0.9),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            decoration: const BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(22),
                              ),
                            ),
                            child: const Text(
                              'Записаться на консультацию',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const PrimaryCard(
                        text: 'Сервисы',
                        icon: Icons.ac_unit,
                      ),
                      const SizedBox(
                        height: 19,
                      ),
                      OnTapScaleAndFade(
                          lowerBound: 0.95,
                          child: const ServicesCardWidget(
                            image: AssetImage(
                              'assets/images/book.png',
                            ),
                            title: 'Органы контроля',
                            subTitle:
                                'Подробная информация о контрольно-надзорных органах',
                          ),
                          onTap: () {
                            Navigator.pushNamed(context, '/services');
                          }),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
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
    );
  }
}

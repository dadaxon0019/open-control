import 'package:flutter/material.dart';
import 'package:opencontrol/widgets/on_tap_scale_and_fade.dart';
import 'package:opencontrol/widgets/primary_card.dart';

import '../../../constants/constants_colors.dart';

class ServicesSecondCard extends StatelessWidget {
  final String title;
  final String description;

  const ServicesSecondCard({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return OnTapScaleAndFade(
      onTap: () {},
      child: Container(
        decoration: kGradientBoxDecoration,
        child: Padding(
          padding: const EdgeInsets.all(0.8),
          child: Container(
            padding: const EdgeInsets.only(
              top: 18,
              bottom: 18,
              left: 10,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(22),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(
                  height: 15,
                ),
                PrimaryCard(text: description)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

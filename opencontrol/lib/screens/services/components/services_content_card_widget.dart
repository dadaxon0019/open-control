import 'package:flutter/material.dart';
import 'package:opencontrol/widgets/on_tap_scale_and_fade.dart';

import '../../../constants/constants_colors.dart';

class ServicesContentCardWidget extends StatelessWidget {
  final String title;
  final String description;

  const ServicesContentCardWidget({
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
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(22),
            ),
            child: Column(
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  description,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          '4',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text('Вид'),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

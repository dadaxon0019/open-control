import 'package:flutter/material.dart';

import '../../../constants/constants_colors.dart';

class ServicesCardWidget extends StatelessWidget {
  final ImageProvider image;
  final String title;
  final String subTitle;

  const ServicesCardWidget({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kGradientBoxDecoration,
      child: Padding(
        padding: const EdgeInsets.all(0.8),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          decoration: BoxDecoration(
            color: const Color(0xff1F1F1F),
            borderRadius: BorderRadius.circular(22),
          ),
          child: Row(
            children: [
              Image(image: image),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      subTitle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Color(0xffC8C8C8)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

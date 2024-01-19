import 'package:flutter/material.dart';
import '../../core/constants/constants.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer(
      {super.key,
      required this.title,
      required this.imageString,
      required this.numerator});

  final String title;

  final String imageString;
  final double numerator;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: kPrimaryColor)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(imageString),
          Text(title, style: kTitleTextStyle),
          Text(
            'You completed ${numerator * 10}%',
            style: kSubtitleTextStyle,
          ),
          const SizedBox(height: 10),
          LinearProgressIndicator(
            minHeight: 10,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            value: numerator / 10,
            backgroundColor: Colors.grey,
          ),
        ],
      ),
    );
  }
}

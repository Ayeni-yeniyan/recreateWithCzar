import 'package:flutter/material.dart';
import '../../core/constants/constants.dart';

class StreakWidget extends StatelessWidget {
  const StreakWidget({super.key, required this.day, required this.isActive});
  final String day;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          day,
          style: kTitleTextStyle.copyWith(
            color: isActive ? kPrimaryColorDeep : const Color(0xFF908A89),
          ),
        ),
        Image.asset(isActive
            ? 'assets/images/streakactive.png'
            : 'assets/images/streakinactive.png'),
      ],
    );
  }
}

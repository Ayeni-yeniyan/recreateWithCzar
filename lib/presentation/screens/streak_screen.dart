import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/constants/constants.dart';
import '../widgets/streak_widget.dart';

class StreakScreen extends StatelessWidget {
  const StreakScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return Column(
          children: [
            const Expanded(child: SizedBox()),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Hero(
                  tag: 'firetag',
                  child: Image.asset(
                    'assets/images/fire.gif',
                    width: 150,
                    height: 150,
                  ),
                ),
                Text(
                  '2',
                  style: TextStyle(fontSize: 200, color: kPrimaryColorDeep),
                ),
              ],
            ),
            Text(
              'days Streak!',
              style: kTitleTextStyle,
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        StreakWidget(day: 'Mon', isActive: true),
                        StreakWidget(day: 'Tue', isActive: true),
                        StreakWidget(day: 'Wed', isActive: false),
                        StreakWidget(day: 'Thu', isActive: false),
                        StreakWidget(day: 'Fri', isActive: false),
                        StreakWidget(day: 'Sat', isActive: false),
                        StreakWidget(day: 'Sun', isActive: false),
                      ],
                    ),
                  ),
                  Text(
                    'You\'re on a roll, great job! Practice each day to keep up with your streak and earn XP points.',
                    style: kSubtitleTextStyle.copyWith(color: Colors.black),
                  )
                ],
              ),
            ),
            const Expanded(child: SizedBox()),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                minimumSize: Size(
                  constraints.maxWidth * 0.9,
                  constraints.maxHeight * 0.07,
                ),
                backgroundColor: kPrimaryColorDeep,
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              child: Text(
                'Continue',
                style: TextStyle(
                  color: kSecondaryColor,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Clipboard.setData(const ClipboardData(
                    text:
                        'Guess who\'s on a 2 days speak on SpeakSpeher. That\'s right, ME!'));
              },
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                minimumSize: Size(
                  constraints.maxWidth * 0.9,
                  constraints.maxHeight * 0.07,
                ),
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              child: Text(
                'Share',
                style: TextStyle(
                  color: kPrimaryColorDeep,
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        );
      }),
    );
  }
}

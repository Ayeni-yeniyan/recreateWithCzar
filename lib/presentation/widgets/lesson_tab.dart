import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../core/constants/constants.dart';
import '../screens/speak_screen.dart';

class LessonTab extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final Color buttonColor;

  const LessonTab({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 120,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          margin: const EdgeInsets.all(25),
          decoration: BoxDecoration(
            image:
                DecorationImage(image: AssetImage(imagePath), fit: BoxFit.fill),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: kTitleTextStyle.copyWith(color: Colors.white),
              ),
              const SizedBox(height: 10),
              Text(
                description,
                style: kSubtitleTextStyle.copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
        Positioned(
          right: 40,
          bottom: 5,
          child: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SpeakScreen()));
            },
            child: CircleAvatar(
              radius: 23,
              backgroundColor: buttonColor,
              child: const FaIcon(
                FontAwesomeIcons.play,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }
}

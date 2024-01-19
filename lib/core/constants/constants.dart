import 'package:flutter/material.dart';

Stack kTextStack = Stack(
  children: [
    Text.rich(
      TextSpan(
        style: TextStyle(
            fontFamily: 'JosefinSans',
            fontSize: 45,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 3
              ..color = const Color(0xFF9F4F4F)),
        text: 'Speak',
        children: const [
          TextSpan(
            text: 'Sphere\n',
          ),
          TextSpan(
            text: '...speak the world',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    ),
    Text.rich(
      TextSpan(
        style: const TextStyle(
          fontFamily: 'JosefinSans',
          fontWeight: FontWeight.bold,
          fontSize: 45,
          color: Colors.white,
        ),
        text: 'Speak',
        children: [
          TextSpan(
            text: 'Sphere\n',
            style: TextStyle(
              color: kPrimaryColor,
            ),
          ),
          const TextSpan(
            text: '...speak the world',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    ),
  ],
);

TextStyle kSubtitleTextStyle = const TextStyle(
  fontSize: 17,
  color: Colors.grey,
  fontFamily: 'JosefinSans',
);

TextStyle kTitleTextStyle = const TextStyle(
  fontSize: 27,
  color: Colors.black,
  fontWeight: FontWeight.bold,
  fontFamily: 'JosefinSans',
);

Color kPrimaryColor = const Color(0xFF9F4F4F);
Color kPrimaryColorDeep = const Color(0xFF650C01);
Color kSecondaryColor = const Color(0xFFDEDECE);

TextStyle kHeadlineTextStyle = TextStyle(
    fontFamily: 'JosefinSans',
    fontWeight: FontWeight.bold,
    fontSize: 35,
    color: kPrimaryColor);

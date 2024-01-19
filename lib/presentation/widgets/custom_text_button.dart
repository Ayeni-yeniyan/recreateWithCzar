import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/interest_provider.dart';

// import 'package:provider/provider.dart';

import '../../core/constants/constants.dart';

class CustomTextButton extends StatefulWidget {
  const CustomTextButton({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<CustomTextButton> createState() => _CustomTextButtonState();
}

class _CustomTextButtonState extends State<CustomTextButton> {
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        if (Provider.of<InterestProvider>(context, listen: false).isComplete) {
          if (isActive) {
            Provider.of<InterestProvider>(context, listen: false).decrement();
            setState(() {
              isActive = !isActive;
            });
          }
          return;
        }

        isActive
            ? Provider.of<InterestProvider>(context, listen: false).decrement()
            : Provider.of<InterestProvider>(context, listen: false).increment();
        setState(() {
          isActive = !isActive;
        });
      },
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        backgroundColor: isActive ? kPrimaryColor : kSecondaryColor,
        textStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
        ),
      ),
      child: DottedBorder(
        dashPattern: isActive ? [6, 0] : [6, 3],
        radius: const Radius.circular(20),
        color: isActive ? kPrimaryColorDeep : kPrimaryColor,
        borderType: BorderType.RRect,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            widget.title,
            style: TextStyle(color: isActive ? Colors.white : Colors.black),
          ),
        ),
      ),
    );
  }
}

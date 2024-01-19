import 'package:flutter/material.dart';

import '../../core/constants/constants.dart';

class ProgressIndicatorRow extends StatelessWidget {
  const ProgressIndicatorRow({
    super.key,
    required this.numerator,
    required this.denominator,
  });
  final int numerator;
  final int denominator;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        Expanded(
          child: LinearProgressIndicator(
            color: kPrimaryColorDeep,
            minHeight: 12,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            value: numerator / denominator,
            backgroundColor: Colors.grey,
          ),
        ),
        const SizedBox(width: 20),
        Text(
          '$numerator/$denominator',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import '../../core/constants/constants.dart';

class SpeakScreen extends StatelessWidget {
  const SpeakScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return Column(
          children: [
            const SizedBox(height: 50),
            Row(
              children: [
                IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back_ios)),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: LinearProgressIndicator(
                      color: kPrimaryColorDeep,
                      minHeight: 12,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      value: 0.6,
                      backgroundColor: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Speak this sentence',
                  style: kTitleTextStyle.copyWith(
                      color: const Color.fromARGB(255, 104, 104, 104)),
                ),
              ),
            ),
            const SizedBox(height: 50),
            CircleAvatar(
              backgroundColor: kPrimaryColorDeep,
              radius: 20,
              child: const Icon(
                Icons.volume_up_outlined,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 50),
            Text(
              'Bonjour, Buchi, enchante',
              style: kTitleTextStyle.copyWith(
                  color: const Color.fromARGB(255, 104, 104, 104)),
            ),
            const SizedBox(height: 50),
            const Expanded(child: SizedBox()),
            Image.asset('assets/images/speakicon.png'),
            const Expanded(child: SizedBox()),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text.rich(
                  TextSpan(
                      text: '\n\nBrilliant!\n \n',
                      style: kTitleTextStyle.copyWith(
                        color: const Color.fromARGB(255, 104, 104, 104),
                      ),
                      children: [
                        TextSpan(
                          text:
                              'Meaning:\n \nHello, Buchi, nice to meet you.\n',
                          style: kTitleTextStyle.copyWith(
                              color: const Color.fromARGB(255, 104, 104, 104),
                              fontSize: 20),
                        )
                      ]),
                ),
              ),
            ),
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
            const SizedBox(height: 20),
          ],
        );
      }),
    );
  }
}

import 'package:flutter/material.dart';
import '../../core/constants/constants.dart';
import '../widgets/custom_container.dart';

import '../widgets/custom_scaffold.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String id = 'Home';

  final List<CustomContainer> _customContainerList = const [
    CustomContainer(
        title: 'Reading', numerator: 5, imageString: 'assets/images/book.png'),
    CustomContainer(
        title: 'Listening',
        numerator: 5,
        imageString: 'assets/images/headphone.png'),
    CustomContainer(
        title: 'Writing', numerator: 7, imageString: 'assets/images/hand.png'),
    CustomContainer(
        title: 'Speaking',
        numerator: 2.5,
        imageString: 'assets/images/speaker.png'),
    CustomContainer(
        title: 'Books', numerator: 8, imageString: 'assets/images/books.png'),
    CustomContainer(
        title: 'Quizzes', numerator: 4, imageString: 'assets/images/quiz.png'),
    CustomContainer(
        title: 'Teaching',
        numerator: 7.5,
        imageString: 'assets/images/books.png'),
    CustomContainer(
        title: 'Tactics', numerator: 9, imageString: 'assets/images/quiz.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScafold(
      showAppBar: true,
      screenId: HomeScreen.id,
      body: [
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Your\nLearning Sphere',
                style: kHeadlineTextStyle,
              ),
              Image.asset('assets/images/box.png'),
            ],
          ),
        ),
        Expanded(
          child: GridView.count(
            crossAxisCount: 2,
            children: _customContainerList,
          ),
        )
      ],
    );
  }
}

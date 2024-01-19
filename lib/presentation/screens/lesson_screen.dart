import 'package:flutter/material.dart';
import '../../core/constants/constants.dart';
import '../widgets/coming_soon.dart';
import '../widgets/lesson_tab.dart';

import '../widgets/custom_scaffold.dart';

class LessonScreen extends StatelessWidget {
  const LessonScreen({super.key});
  static const String id = 'Lesson';

  final List<LessonTab> lessontabList = const [
    LessonTab(
      imagePath: 'assets/images/image1.png',
      title: 'First Trip',
      description:
          'Here you will listen to \nconversations between tourists, \nand learn to speak together with \nthem!',
      buttonColor: Color(0xFFE16723),
    ),
    LessonTab(
      imagePath: 'assets/images/image2.png',
      title: 'Freelance Work',
      description:
          'After taking this classes, you will \nbe able to take orders from \nforeigners!',
      buttonColor: Color(0xFF908A89),
    ),
    LessonTab(
      imagePath: 'assets/images/image3.png',
      title: 'First Meeting',
      description:
          'You will learn to communicate \nwith your colleagues and \nunderstand them!',
      buttonColor: Color(0xFFCB9937),
    ),
    LessonTab(
      imagePath: 'assets/images/image4.png',
      title: 'Meeting With Partners ',
      description:
          'You will learn to communicate \nwith your colleagues and \nunderstand them!',
      buttonColor: Colors.black,
    ),
    LessonTab(
      imagePath: 'assets/images/image1.png',
      title: 'Meeting With Devs ',
      description:
          'Here you will meet developers, tech bros \nand choo kids and learn to speak together with \nthem!',
      buttonColor: Colors.brown,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: CustomScafold(
        showAppBar: true,
        screenId: LessonScreen.id,
        body: [
          const SizedBox(height: 20),
          Container(
            height: 50,
            width: 350,
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                color: const Color.fromARGB(126, 144, 138, 137),
              ),
            ),
            child: TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              overlayColor: MaterialStateColor.resolveWith(
                  (states) => Colors.transparent),
              unselectedLabelColor: const Color.fromARGB(126, 144, 138, 137),
              labelStyle: kTitleTextStyle.copyWith(fontSize: 20),
              labelColor: Colors.white,
              dividerHeight: 0,
              indicator: BoxDecoration(
                  color: kPrimaryColorDeep,
                  borderRadius: BorderRadius.circular(30)),
              tabs: const [
                Tab(
                  text: 'Audio Lesson',
                ),
                Tab(
                  text: 'Video Lesson',
                )
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                ListView(
                  children: lessontabList,
                ),
                const ComingSoon()
              ],
            ),
          )
        ],
      ),
    );
  }
}

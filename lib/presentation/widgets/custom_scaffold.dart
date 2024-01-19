import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../screens/chat_screen.dart';
import '../screens/exercise_screen.dart';
import '../screens/game_screen.dart';
import '../screens/home_screen.dart';
import '../screens/lesson_screen.dart';
import '../screens/streak_screen.dart';

import '../../core/constants/constants.dart';

class CustomScafold extends StatelessWidget {
  const CustomScafold({
    super.key,
    required this.body,
    required this.screenId,
    required this.showAppBar,
  });
  final String screenId;
  final List<Widget> body;
  final bool showAppBar;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 15),
            Visibility(
              visible: showAppBar,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      width: double.infinity,
                      height: 36,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: const Color.fromARGB(126, 144, 138, 137),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset('assets/images/flag.png'),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder: (context, ani1, ani2) =>
                                        const StreakScreen(),
                                  ));
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Hero(
                                  tag: 'firetag',
                                  child: Image.asset(
                                    'assets/images/fire.gif',
                                    width: 20,
                                    height: 20,
                                  ),
                                ),
                                Text(
                                  '2',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: kPrimaryColorDeep,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/images/bullseye.png',
                                width: 20,
                                height: 20,
                              ),
                              Text(
                                '17',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: kPrimaryColorDeep,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(),
                          Stack(children: [
                            const Icon(
                              Icons.notifications_none_sharp,
                              size: 20,
                            ),
                            Positioned(
                              right: 2,
                              top: 3,
                              child: CircleAvatar(
                                radius: 3,
                                backgroundColor: Colors.red.shade700,
                              ),
                            ),
                          ])
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: CircleAvatar(
                      radius: 18,
                      backgroundColor: const Color(0xFFFFBFB6),
                      child: Image.asset(
                        'assets/images/avatar.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  )
                ],
              ),
            ),
            ...body,
            Container(
              decoration: BoxDecoration(
                  color: kSecondaryColor,
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0),
                        blurRadius: 4)
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomNavBarItem(
                    screenId: screenId,
                    label: HomeScreen.id,
                    itemIcon: FontAwesomeIcons.house,
                    onButtonTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, ani1, ani2) =>
                              const HomeScreen(),
                        ),
                      );
                    },
                  ),
                  CustomNavBarItem(
                    screenId: screenId,
                    label: LessonScreen.id,
                    itemIcon: FontAwesomeIcons.bookBookmark,
                    onButtonTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, ani1, ani2) =>
                              const LessonScreen(),
                        ),
                      );
                    },
                  ),
                  CustomNavBarItem(
                    screenId: screenId,
                    label: ExerciseScreen.id,
                    itemIcon: FontAwesomeIcons.solidFileLines,
                    onButtonTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, ani1, ani2) =>
                              const ExerciseScreen(),
                        ),
                      );
                    },
                  ),
                  CustomNavBarItem(
                    screenId: screenId,
                    label: GameScreen.id,
                    itemIcon: FontAwesomeIcons.gamepad,
                    onButtonTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, ani1, ani2) =>
                              const GameScreen(),
                        ),
                      );
                    },
                  ),
                  CustomNavBarItem(
                    screenId: screenId,
                    label: ChatScreen.id,
                    itemIcon: FontAwesomeIcons.solidMessage,
                    onButtonTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, ani1, ani2) =>
                              const ChatScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomNavBarItem extends StatelessWidget {
  const CustomNavBarItem({
    super.key,
    required this.onButtonTap,
    required this.label,
    required this.itemIcon,
    required this.screenId,
  });
  final void Function() onButtonTap;
  final String label;
  final IconData itemIcon;
  final String screenId;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: screenId == label ? null : onButtonTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          screenId == label
              ? Hero(
                  tag: 'navtag',
                  child: Container(
                    width: 35,
                    height: 3,
                    decoration: BoxDecoration(
                      color: kPrimaryColorDeep,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5),
                      ),
                    ),
                  ),
                )
              : const SizedBox(height: 3),
          const SizedBox(height: 10),
          FaIcon(
            itemIcon,
            size: 25,
            color: screenId == label ? kPrimaryColorDeep : Colors.grey,
          ),
          Text(
            label,
            style: TextStyle(
              color: screenId == label ? kPrimaryColorDeep : Colors.grey,
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

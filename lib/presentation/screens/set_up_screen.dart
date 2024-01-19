import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/constants/constants.dart';
import '../provider/interest_list.dart';
import '../provider/interest_provider.dart';
import 'home_screen.dart';

import '../widgets/custom_text_button.dart';
import '../widgets/progress_ind_widget.dart';

class SetUpScreen extends StatefulWidget {
  const SetUpScreen({super.key});

  @override
  State<SetUpScreen> createState() => _SetUpScreenState();
}

class _SetUpScreenState extends State<SetUpScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _containerAnimationController;
  late Animation _containerAnimation;

  @override
  void initState() {
    _containerAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    _containerAnimation = CurvedAnimation(
      parent: _containerAnimationController,
      curve: Curves.easeInExpo,
    );
    Future.delayed(const Duration(milliseconds: 300), () {
      _containerAnimationController.forward();
    });

    _containerAnimation.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 0, 0, 0),
          image: DecorationImage(
            image: AssetImage('assets/images/splash.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: LayoutBuilder(builder: (context, constraints) {
          return Stack(
            children: [
              Positioned(
                top: constraints.maxHeight * 0.105,
                left: constraints.maxWidth * 0.2,
                child: Image.asset('assets/images/spl.png'),
              ),
              Positioned(
                top: constraints.maxHeight * 0.1,
                left: constraints.maxWidth * 0.3,
                child: kTextStack,
              ),
              Positioned.fill(
                top: constraints.maxHeight * 0.3,
                child: Image.asset(
                  'assets/images/firstimg.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
              Positioned(
                top: constraints.maxHeight * 0.04,
                right: 0,
                child: Image.asset('assets/images/spinwheel.png'),
              ),
              Positioned(
                top: constraints.maxHeight * 0.47,
                left: constraints.maxWidth * 0.78,
                child: Image.asset('assets/images/chat1.png'),
              ),
              Positioned(
                top: constraints.maxHeight * 0.49,
                left: constraints.maxWidth * 0.82,
                child: Image.asset('assets/images/chat2.png'),
              ),
              Positioned(
                top: constraints.maxHeight * 0.616,
                left: constraints.maxWidth * 0.386,
                child: Image.asset('assets/images/talk1.png'),
              ),
              Positioned(
                top: constraints.maxHeight * 0.610,
                left: constraints.maxWidth * 0.38,
                child: Image.asset('assets/images/talk2.png'),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: BoxDecoration(
                    color: kSecondaryColor,
                    borderRadius: _containerAnimation.isCompleted
                        ? BorderRadius.zero
                        : const BorderRadius.only(
                            topLeft: Radius.circular(200),
                            topRight: Radius.circular(200),
                          ),
                  ),
                  height: constraints.maxHeight * _containerAnimation.value,
                  width: constraints.maxWidth,
                  child: _getSetUpUI(constraints),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  _getSetUpUI(BoxConstraints constraints) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 500),
      opacity: _containerAnimation.isCompleted ? 1 : 0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        child: Column(
          children: [
            Consumer<InterestProvider>(
              builder: (BuildContext context, InterestProvider value,
                  Widget? child) {
                return ProgressIndicatorRow(
                  numerator: context.read<InterestProvider>().getInterestCount,
                  denominator: 6,
                );
              },
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'What interests you?',
                style: kTitleTextStyle,
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Select all that applies',
                style: kSubtitleTextStyle,
              ),
            ),
            const SizedBox(height: 20),
            buildInterestRow(first: 0, last: 4),
            buildInterestRow(first: 4, last: 7),
            buildInterestRow(first: 7, last: 11),
            buildInterestRow(first: 11, last: 15),
            buildInterestRow(first: 15, last: 19),
            buildInterestRow(first: 19, last: 23),
            buildInterestRow(first: 23, last: 25),
            const Align(
              alignment: Alignment.topLeft,
              child: CustomTextButton(title: 'Add Others +'),
            ),
            const Expanded(child: SizedBox()),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ));
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
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ));
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
                'Skip for now',
                style: TextStyle(
                  color: kPrimaryColorDeep,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Builder buildInterestRow({required int first, required int last}) {
    return Builder(builder: (context) {
      late List<Widget> textButtonList = [];
      interestList.sublist(first, last).forEach((element) {
        textButtonList.add(CustomTextButton(title: element));
        textButtonList.add(const SizedBox(width: 10));
      });
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: textButtonList,
      );
    });
  }
}

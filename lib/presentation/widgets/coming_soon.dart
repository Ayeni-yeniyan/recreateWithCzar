import 'package:flutter/material.dart';
import '../../core/constants/constants.dart';

class ComingSoon extends StatefulWidget {
  const ComingSoon({super.key});

  @override
  State<ComingSoon> createState() => _ComingSoonState();
}

class _ComingSoonState extends State<ComingSoon>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;
  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));
    _animation = CurvedAnimation(
        parent: _animationController, curve: Curves.bounceInOut);

    _animationController.forward();
    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reverse(from: 1);
      } else if (status == AnimationStatus.dismissed) {
        _animationController.forward();
      }
    });
    _animationController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Opacity(
          opacity: _animation.value,
          child: Column(
            children: [
              Container(height: 100),
              Image.asset('assets/images/bro.png'),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                    padding: const EdgeInsets.only(right: 65),
                    child: Image.asset('assets/images/spinner.png')),
              ),
              Text(
                'Coming Soon',
                style: kTitleTextStyle.copyWith(color: kPrimaryColorDeep),
              ),
              Text(
                'We’ll be up soon, keep an eye on us.',
                style: kSubtitleTextStyle,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Icon(
                    Icons.flash_on_rounded,
                    color: kPrimaryColorDeep,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

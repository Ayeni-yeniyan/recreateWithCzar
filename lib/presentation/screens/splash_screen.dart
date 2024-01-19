import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'set_up_screen.dart';

import '../../core/constants/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    _animationController = AnimationController(
        vsync: this, upperBound: 4, duration: const Duration(seconds: 4));
    _animationController.forward();
    _animationController.addListener(() {
      setState(() {});
    });
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
          pageBuilder: (context, animation1, animation2) => const SetUpScreen(),
        ),
      );
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
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
          return AnimatedOpacity(
            duration: const Duration(milliseconds: 700),
            opacity: _animationController.value < 0.5 ? 0 : 1,
            child: Stack(
              children: [
                _animationController.value <= 2
                    ? const SizedBox()
                    : Positioned(
                        top: constraints.maxHeight * 0.105,
                        left: constraints.maxWidth * 0.2,
                        child: Image.asset('assets/images/spl.png'),
                      ),
                Positioned(
                  top: constraints.maxHeight * 0.04,
                  right: 0,
                  child: Image.asset('assets/images/spinwheel.png'),
                ),
                Positioned(
                    top: constraints.maxHeight * 0.1,
                    left: constraints.maxWidth * 0.3,
                    child: kTextStack),
                Positioned.fill(
                  top: constraints.maxHeight * 0.3,
                  child: Image.asset(
                    'assets/images/firstimg.png',
                    fit: BoxFit.fitWidth,
                  ),
                ),
                _animationController.value <= 2
                    ? const SizedBox()
                    : Positioned(
                        top: constraints.maxHeight * 0.47,
                        left: constraints.maxWidth * 0.78,
                        child: Image.asset('assets/images/chat1.png'),
                      ),
                _animationController.value <= 3
                    ? const SizedBox()
                    : Positioned(
                        top: constraints.maxHeight * 0.49,
                        left: constraints.maxWidth * 0.82,
                        child: Image.asset('assets/images/chat2.png'),
                      ),
                _animationController.value <= 2
                    ? const SizedBox()
                    : Positioned(
                        top: constraints.maxHeight * 0.616,
                        left: constraints.maxWidth * 0.386,
                        child: Image.asset('assets/images/talk1.png'),
                      ),
                _animationController.value <= 3
                    ? const SizedBox()
                    : Positioned(
                        top: constraints.maxHeight * 0.610,
                        left: constraints.maxWidth * 0.38,
                        child: Image.asset('assets/images/talk2.png'),
                      ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

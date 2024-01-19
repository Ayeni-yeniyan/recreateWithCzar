import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/constants/constants.dart';
import 'presentation/provider/interest_provider.dart';
import 'presentation/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => InterestProvider(),
      child: MaterialApp(
        title: 'SpeakSphere',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor),
          scaffoldBackgroundColor: kSecondaryColor,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}

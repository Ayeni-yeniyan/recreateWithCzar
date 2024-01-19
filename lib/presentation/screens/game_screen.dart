import 'package:flutter/material.dart';

import '../widgets/coming_soon.dart';
import '../widgets/custom_scaffold.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});
  static const String id = 'Games';

  @override
  Widget build(BuildContext context) {
    return const CustomScafold(
      showAppBar: false,
      screenId: GameScreen.id,
      body: [
        Expanded(
          child: ComingSoon(),
        ),
      ],
    );
  }
}

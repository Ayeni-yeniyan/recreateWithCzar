import 'package:flutter/material.dart';

import '../widgets/coming_soon.dart';
import '../widgets/custom_scaffold.dart';

class ExerciseScreen extends StatelessWidget {
  const ExerciseScreen({super.key});
  static const String id = 'Exercises';

  @override
  Widget build(BuildContext context) {
    return const CustomScafold(
      showAppBar: false,
      screenId: ExerciseScreen.id,
      body: [
        Expanded(
          child: ComingSoon(),
        ),
      ],
    );
  }
}

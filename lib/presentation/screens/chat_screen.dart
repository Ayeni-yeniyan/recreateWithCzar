import 'package:flutter/material.dart';
import '../widgets/coming_soon.dart';

import '../widgets/custom_scaffold.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});
  static const String id = 'Chats';

  @override
  Widget build(BuildContext context) {
    return const CustomScafold(
      showAppBar: false,
      screenId: ChatScreen.id,
      body: [
        Expanded(
          child: ComingSoon(),
        ),
      ],
    );
  }
}

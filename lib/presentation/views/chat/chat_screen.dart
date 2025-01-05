import 'package:chat_app/presentation/widgets/text/text_widget.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextWidget(
            title: "Chat Will be here",
            fontWeight: FontWeight.bold,
            fontSize: 19,
          )
        ],
      ),
    );
  }
}

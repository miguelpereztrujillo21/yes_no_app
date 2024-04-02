import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class MyMessageBubble extends StatelessWidget {
  final Message message;
  const MyMessageBubble({super.key, required this.message});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          margin:
              const EdgeInsets.only(left: 100, right: 10, bottom: 10, top: 10),
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              message.text,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 10)
      ],
    );
  }
}

import 'package:flutter/material.dart';

enum TextDividerType { left, right, center }

class TextDivider extends StatelessWidget {
  final String text;
  final TextDividerType type;

  const TextDivider({super.key, required this.text, required this.type});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 15,
      children: [
        Expanded(child: Divider()),
        Text(text, style: TextStyle(color: Colors.grey)),
        Expanded(child: Divider()),
      ],
    );
  }
}

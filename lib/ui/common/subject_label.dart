import 'package:flutter/material.dart';

class SubjectLabel extends StatelessWidget {
  final String text;

  const SubjectLabel({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 215, 215, 215),
        borderRadius: .circular(8),
      ),
      child: Text(
        text,
        style: const TextStyle(fontWeight: .w700, fontSize: 12),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class LabelTextFiled extends StatelessWidget {
  final String label;
  final String hintText;
  final IconData icon;
  final TextEditingController? controller;
  final bool obscureText;

  const LabelTextFiled({
    super.key,
    required this.label,
    required this.hintText,
    required this.icon,
    this.controller,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: Icon(icon),
            filled: true,
            fillColor: const Color(0xFFF7F7F9),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 18,
            ),
          ),
        ),
      ],
    );
  }
}

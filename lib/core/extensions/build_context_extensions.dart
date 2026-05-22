import 'package:flutter/material.dart';

extension BuildContextExtensions on BuildContext {
  void showSnackbar(String text, {bool isError = false}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: isError ? Colors.red : Colors.green,
        content: Text(text),
      ),
    );
  }
}

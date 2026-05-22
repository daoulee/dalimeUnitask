import 'package:flutter/material.dart';
import 'package:unitask/app/theme/preview.dart';

@AppThemePreview(group: 'Buttons', name: 'HighlightButton')
Widget preview() {
  return const HighlightButton(child: Text('새 과제 추가'));
}

class HighlightButton extends StatelessWidget {
  final Color color;
  final double spacing;
  final Widget child;
  final Widget? leading;
  final Widget? trailing;
  final Function? onPressed;

  const HighlightButton({
    super.key,
    this.color = Colors.blue,
    this.spacing = 10.0,
    required this.child,
    this.leading,
    this.trailing,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed as VoidCallback?,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 14),
        decoration: BoxDecoration(
          border: Border.all(color: color, width: 2),
          borderRadius: BorderRadius.circular(10),
          color: color.withValues(alpha: 0.3),
        ), // BoxDecoration
        alignment: Alignment.center,
        child: Row(
          spacing: spacing,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (leading != null && leading is Icon)
              Icon(
                (leading as Icon).icon,
                color: (leading as Icon).color ?? color,
                size: (leading as Icon).size,
              ) // Icon
            else
              ?leading,
            DefaultTextStyle(
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: color,
              ), // TextStyle
              child: child,
            ), // DefaultTextStyle
            ?trailing,
          ],
        ), // Row
      ), // Container
    ); // GestureDetector
  }
}

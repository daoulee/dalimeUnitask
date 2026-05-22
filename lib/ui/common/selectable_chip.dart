import 'package:flutter/material.dart';
import 'package:unitask/app/theme/preview.dart';

@AppThemePreview(name: 'SelectableChip', group: 'Buttons')
Widget preview() => Wrap(
  spacing: 10,
  runSpacing: 10,
  children: [
    SelectableChip(name: '전체', selected: true),
    SelectableChip(name: '진행중'),
    SelectableChip(name: '완료'),
  ],
);

class SelectableChip extends StatelessWidget {
  final String name;
  final bool selected;
  final VoidCallback? onTap;

  const SelectableChip({
    super.key,
    required this.name,
    this.selected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 14),
        decoration: BoxDecoration(
          color: selected ? colorScheme.primary : colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(50),
        ), // BoxDecoration
        child: Text(
          name,
          style: TextStyle(
            fontSize: 16,
            fontWeight: selected ? FontWeight.bold : null,
            color: selected ? colorScheme.onPrimary : colorScheme.onSurface,
          ), // TextStyle
        ), // Text
      ), // Container
    ); // GestureDetector
  }
}

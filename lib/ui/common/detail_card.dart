import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:unitask/app/theme/preview.dart';

@AppThemePreview(group: 'Card', name: 'DetailCard')
Widget preview() => DetailCard(
  subject: 'Flutter',
  title: 'UniTask 끝내기',
  date: DateTime.now().copyWith(
    month: 6,
    day: 4,
    hour: 0,
    minute: 0,
    second: 0,
  ),
); // DetailCard

class DetailCard extends StatelessWidget {
  final String subject;
  final String title;
  final DateTime date;

  const DetailCard({
    super.key,
    required this.subject,
    required this.title,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: .circular(18),
        gradient: const LinearGradient(
          colors: [Color(0xFF6366F1), Color(0xFF3B82F6)],
          begin: .bottomLeft,
          end: .topRight,
        ), // LinearGradient
      ), // BoxDecoration
      child: Column(
        spacing: 16,
        crossAxisAlignment: .start,
        children: [
          _badge(text: subject),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: .bold,
              overflow: .ellipsis,
            ), // TextStyle
          ), // Text
          Row(
            spacing: 10,
            children: [
              _badge(
                text: DateFormat('yyyy.MM.dd').format(date),
                icon: LucideIcons.calendarRange,
              ),
              _badge(
                text: 'D-${date.difference(DateTime.now()).inDays}',
                isPrimary: true,
              ),
            ],
          ), // Row
        ],
      ), // Column
    ); // Container
  }

  Container _badge({
    required String text,
    IconData? icon,
    bool isPrimary = false,
    bool isWide = false,
    BorderRadiusGeometry? borderRadius,
  }) {
    return Container(
      width: isWide ? double.infinity : null,
      padding: EdgeInsets.symmetric(horizontal: isWide ? 20 : 12, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? .circular(10),
        color: Colors.white.withValues(alpha: isPrimary ? 1 : .2),
      ), // BoxDecoration
      child: Row(
        mainAxisSize: .min,
        spacing: 5,
        children: [
          if (icon != null) Icon(icon, color: Colors.white, size: 14), // Icon
          Text(
            text,
            style: TextStyle(
              color: isPrimary ? Colors.blueAccent : Colors.white,
              fontWeight: .w700,
              fontSize: 12,
            ), // TextStyle
          ), // Text
        ],
      ), // Row
    ); // Container
  }
}

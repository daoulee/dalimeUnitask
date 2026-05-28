import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:unitask/app/theme/preview.dart';
import 'package:unitask/ui/common/subject_label.dart';

@AppThemePreview(group: 'Items', name: 'TaskCard', brightness: .light)
Widget preview() => TaskCard(
  onSelected: () {},
  onChecked: (value) {},
  checked: false,
  title: 'Unitask 끝내기',
  date: DateTime.now(),
  category: const SubjectLabel(text: 'Flutter'), // SubjectLabel
); // TaskCard

class TaskCard extends StatelessWidget {
  final bool checked;
  final String title;
  final DateTime date;
  final VoidCallback? onSelected;
  final Function(bool? value)? onChecked;
  final Widget category;

  const TaskCard({
    super.key,
    required this.checked,
    required this.title,
    required this.date,
    required this.category,
    this.onSelected,
    this.onChecked,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: 아이콘 색상 설정은 아래와 같음
    // ≤ D-3 : 빨강
    // ≤ D-7 : 주황
    // > D-7 : 검정
    final dDay = DateTime.now().difference(date).inDays;

    final dDayColor = switch (dDay) {
      <= 3 => Colors.red, // 3일 남음
      <= 7 => Colors.orange, // 7일 남음
      _ => Colors.black, // 그 외
    };

    return Card(
      child: Container(
        height: 120,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          mainAxisAlignment: .spaceBetween,
          crossAxisAlignment: .stretch,
          children: [
            // 과목 라벨 / 체크박스
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                category,
                Checkbox(
                  onChanged: onChecked,
                  value: checked,
                  visualDensity: .compact,
                  fillColor: .resolveWith(
                    (states) => states.contains(WidgetState.selected)
                        ? Colors.blue
                        : const Color.fromARGB(255, 215, 215, 215),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: .circular(5),
                  ), // RoundedRectangleBorder
                  side: const BorderSide(
                    color: Colors.transparent,
                  ), // BorderSide
                  materialTapTargetSize: .shrinkWrap,
                ), // Checkbox
              ],
            ), // Row
            // 타이틀
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w700),
            ), // Text
            // 기한 표시
            Row(
              spacing: 5,
              children: [
                Icon(
                  LucideIcons.calendarRange,
                  size: 12,
                  color: dDayColor,
                ), // Icon
                Text(
                  DateFormat('yyyy.MM.dd').format(date),
                  style: TextStyle(fontSize: 12, color: dDayColor), // TextStyle
                ), // Text
              ],
            ), // Row
          ],
        ), // Column
      ), // Container
    ); // Card
  }
}

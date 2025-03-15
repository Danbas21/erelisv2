import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../config/app_colors.dart';

class CalendarCard extends StatefulWidget {
  final DateTime selectedDate;
  final Function(DateTime) onDateSelected;

  const CalendarCard({
    super.key,
    required this.selectedDate,
    required this.onDateSelected,
  });

  @override
  State<CalendarCard> createState() => _CalendarCardState();
}

class _CalendarCardState extends State<CalendarCard> {
  late DateTime _currentMonth;
  late List<DateTime> _daysToShow;

  @override
  void initState() {
    super.initState();
    _currentMonth =
        DateTime(widget.selectedDate.year, widget.selectedDate.month, 1);
    _generateDaysToShow();
  }

  @override
  void didUpdateWidget(CalendarCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedDate != widget.selectedDate) {
      // Si la fecha seleccionada cambió, podríamos necesitar actualizar los días a mostrar
      if (widget.selectedDate.month != _currentMonth.month) {
        _currentMonth =
            DateTime(widget.selectedDate.year, widget.selectedDate.month, 1);
      }
      _generateDaysToShow();
    }
  }

  void _generateDaysToShow() {
    // Obtener los días para la semana actual
    final DateTime weekStart = widget.selectedDate.subtract(
      Duration(days: widget.selectedDate.weekday - 1),
    );

    _daysToShow = List.generate(
      7,
      (index) => weekStart.add(Duration(days: index)),
    );
  }

  void _previousWeek() {
    final newDate = widget.selectedDate.subtract(const Duration(days: 7));
    widget.onDateSelected(newDate);
  }

  void _nextWeek() {
    final newDate = widget.selectedDate.add(const Duration(days: 7));
    widget.onDateSelected(newDate);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.cardBackground,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Month navigation
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  DateFormat('MMMM yyyy').format(_currentMonth),
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios,
                          size: 14, color: AppColors.textSecondary),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: _previousWeek,
                    ),
                    const SizedBox(width: 16),
                    IconButton(
                      icon: const Icon(Icons.arrow_forward_ios,
                          size: 14, color: AppColors.textSecondary),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: _nextWeek,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Week days
            LayoutBuilder(
              builder: (context, constraints) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: _daysToShow.map((date) {
                    final isSelected = _isSameDay(date, widget.selectedDate);
                    return _buildDayItem(date, isSelected);
                  }).toList(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDayItem(DateTime date, bool isSelected) {
    // Obtener abreviación del día de la semana (3 letras)
    final dayName = DateFormat('E').format(date).substring(0, 3);

    return GestureDetector(
      onTap: () => widget.onDateSelected(date),
      child: Container(
        width: 40,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryLightBlue : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              dayName,
              style: TextStyle(
                color: isSelected ? Colors.white : AppColors.textSecondary,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              date.day.toString(),
              style: TextStyle(
                color: isSelected ? Colors.white : AppColors.textPrimary,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
}

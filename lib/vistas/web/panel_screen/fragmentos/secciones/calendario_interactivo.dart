import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../../../provider/panel_eventos_provider.dart';
import '../../../../../utils/custom/custom_colors.dart';

class CalendarioInteractivo extends StatelessWidget {
  const CalendarioInteractivo({super.key});

  @override
  Widget build(BuildContext context) {
    final eventosProvider = Provider.of<EventosProvider>(context);

    return Card(
      elevation: 3,
      color: Colors.grey[300],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: TableCalendar(
            availableCalendarFormats: const {
              CalendarFormat.month: 'Mes',
            },
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: eventosProvider.focusedDay,
            selectedDayPredicate: (day) {
              return isSameDay(eventosProvider.selectedDay, day);
            },
            eventLoader: (day) {
              return eventosProvider.getEventsForDay(day);
            },
            calendarStyle: const CalendarStyle(
              todayDecoration: BoxDecoration(
                color: AppColors.azulClaro,
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                color: AppColors.amarilloSupernova,
                shape: BoxShape.circle,
              ),
            ),
            onDaySelected: (selectedDay, focusedDay) {
              eventosProvider.onDaySelected(selectedDay, focusedDay);
            },
          ),
        ),
      ),
    );
  }
}
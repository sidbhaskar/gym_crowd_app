import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controller/calendar_controller.dart';
import '../controller/timepicker_controller.dart';

class StatsPage extends StatelessWidget {
  const StatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CalendarController calendarController = Get.put(CalendarController());
    final TimePickerController timePickerController =
        Get.put(TimePickerController());
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              DateFormat('dd-MM-yyyy').format(
                  calendarController.selectedDay.value), // Format the date
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
            Obx(() {
              final selectedTime = timePickerController.selectedTime.value;
              final formattedHour = selectedTime.hour % 12;
              final amPm = selectedTime.hour >= 12 ? 'PM' : 'AM';

              return Text(
                '${formattedHour.toString().padLeft(2, '0')}:${selectedTime.minute.toString().padLeft(2, '0')} $amPm',
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              );
            }),
          ],
        ),
      ),
    );
  }
}

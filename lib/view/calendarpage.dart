import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';

import '../controller/calendar_controller.dart';
import '../controller/timepicker_controller.dart';
import 'statspage.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CalendarController controller = Get.put(CalendarController());
    final TimePickerController timePickerController =
        Get.put(TimePickerController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(
              () => TableCalendar(
                calendarStyle: CalendarStyle(
                  defaultTextStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
                firstDay: DateTime.utc(2021, 1, 1),
                lastDay: DateTime.utc(2030, 12, 31),
                focusedDay: controller.selectedDay.value,
                selectedDayPredicate: (day) {
                  return isSameDay(controller.selectedDay.value, day);
                },
                onDaySelected: controller.onDaySelected,
                headerStyle: const HeaderStyle(
                  leftChevronIcon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                  rightChevronIcon: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                  titleTextStyle: TextStyle(color: Colors.white),
                  titleCentered: true,
                  formatButtonVisible: false,
                ),
                daysOfWeekStyle: DaysOfWeekStyle(
                  weekdayStyle: TextStyle(color: Colors.white),
                  weekendStyle: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 34.0, vertical: 5),
                child: Text(
                  'Set Time',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white70),
                ),
              ),
            ),
            TimePickerSpinner(
              normalTextStyle:
                  const TextStyle(color: Colors.white70, fontSize: 20),
              highlightedTextStyle:
                  const TextStyle(color: Colors.white, fontSize: 35),
              itemWidth: 100,
              is24HourMode: false,
              onTimeChange: (time) {
                timePickerController.updateTime(time);
              },
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Get.to(const StatsPage());
              },
              child: Container(
                height: 70,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white10,
                ),
                child: const Center(
                  child: Text(
                    'Next',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

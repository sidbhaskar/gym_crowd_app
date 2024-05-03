import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controller/calendar_controller.dart';
import '../controller/timepicker_controller.dart';
import 'visitcount.dart';

class InfoBox extends StatelessWidget {
  const InfoBox({super.key});

  @override
  Widget build(BuildContext context) {
    final CalendarController calendarController = Get.put(CalendarController());
    final TimePickerController timePickerController =
        Get.put(TimePickerController());
    return // Info Box
        Container(
      height: MediaQuery.sizeOf(context).height * 0.2,
      width: MediaQuery.sizeOf(context).width * 0.9,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white70),
          borderRadius: BorderRadius.circular(23)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // first 'A' section
          Container(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Date',
                        style: TextStyle(fontSize: 14, color: Colors.white70),
                      ),
                      Text(
                        DateFormat('dd-MM-yyyy')
                            .format(calendarController.selectedDay.value),
                        style:
                            const TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Time',
                        style: TextStyle(color: Colors.white70),
                      ),
                      Obx(() {
                        final selectedTime =
                            timePickerController.selectedTime.value;
                        final formattedHour = selectedTime.hour % 12;
                        final amPm = selectedTime.hour >= 12 ? 'PM' : 'AM';

                        return Text(
                          '${formattedHour.toString().padLeft(2, '0')}:${selectedTime.minute.toString().padLeft(2, '0')} $amPm',
                          style: const TextStyle(
                              fontSize: 16, color: Colors.white),
                        );
                      }),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // "A" part end.

          // "Middle Image" part:
          Container(
            child: const CircleAvatar(
              backgroundColor: Colors.white70,
              radius: 50,
              child: Icon(
                Icons.person,
                color: Color.fromARGB(255, 65, 65, 65),
              ),
            ),
          ),

          // Third "B" part:
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        'Actual Users',
                        style: const TextStyle(
                            fontSize: 14, color: Colors.white70),
                      ),
                      VisitCountWidget(),
                    ],
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Predicted Users',
                        style: const TextStyle(
                            fontSize: 14, color: Colors.white70),
                      ),
                      Text(
                        'Data',
                        style:
                            const TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
    // Part "B" ends.
  }
}

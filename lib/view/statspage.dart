import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_crowd_app/widgets/info_box.dart';

import '../controller/calendar_controller.dart';
import '../controller/timepicker_controller.dart';
import '../widgets/analytics_dropdown.dart';
import '../widgets/visitcount.dart';
import '../widgets/visitcountgraph.dart';

class StatsPage extends StatelessWidget {
  const StatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final CalendarController calendarController = Get.put(CalendarController());
    // final TimePickerController timePickerController =
    //     Get.put(TimePickerController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('CROWD PREDICTION'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InfoBox(),
          SizedBox(height: 20),
          Container(
            width: MediaQuery.sizeOf(context).width * 0.9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Day Analytics',
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius:
                          BorderRadius.circular(10), // Add rounded corners
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18.0),
                      child: AnalyticsDropdown(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: VisitCountScreen(),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Comfirm'),
          ),
        ],
      ),
    );
  }
}

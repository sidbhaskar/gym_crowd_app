import 'package:get/get.dart';

class CalendarController extends GetxController {
  var selectedDay = DateTime.now().obs;

  void saveSelectedDate(DateTime date) {
    print('Selected Date: $date');
  }

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    this.selectedDay.value = selectedDay;
  }
}

import 'package:get/get.dart';

class TimePickerController extends GetxController {
  Rx<DateTime> selectedTime = DateTime.now().obs;

  void updateTime(DateTime time) {
    selectedTime.value = time;
    print('Time: ${time}');
  }
}

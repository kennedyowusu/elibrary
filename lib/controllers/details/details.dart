import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class Details extends GetxController {
  bool isAvailable = true;

  void setIsAvailable(bool value) {
    if (value) {
      isAvailable = true;
    } else {
      isAvailable = false;
    }
  }
}

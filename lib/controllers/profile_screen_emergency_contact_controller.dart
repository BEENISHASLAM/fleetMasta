import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ProfileEmergencyContact extends GetxController{
  var selectedValue = ''.obs;
  var isOtherSelected = false.obs;
  void setSelectedValue(String value) {
    selectedValue.value = value;
    isOtherSelected.value = value == 'Other';
  }


}
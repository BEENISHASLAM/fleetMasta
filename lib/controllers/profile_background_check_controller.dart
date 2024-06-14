import 'package:get/get.dart';
class ProfileScreenBgCheckController extends GetxController {

  var selectedValue = ''.obs;
  var isValidationEnabledBgCheck = true.obs;
  void setSelectedValue(String value) {
    selectedValue.value = value;
    isValidationEnabledBgCheck.value = value == 'Yes';
  }



}

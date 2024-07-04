import 'package:fleetmasta/config/global.dart';
import 'package:get/get.dart';
class ProfileScreenBgCheckController extends GetxController {

  var selectedValue = ''.obs;
  var isValidationEnabledBgCheck = true.obs;
  void setSelectedValue(String value) {
    selectedValue.value = value;
    isValidationEnabledBgCheck.value = value == 'Yes';
    Global().fileUploadValue.add(value);
  }



}

import 'package:fleetmasta/config/global.dart';
import 'package:get/get.dart';

class ProfileScreenMedicalHistoryController extends GetxController {
  var selectedValue = ''.obs;
  var selectedValue1 = ''.obs;
  var isValidationEnabled = true.obs;
  var isValidationEnabled1 = false.obs;
   var checkMedicalHistory= true.obs;
  void setSelectedValue(String value) {
    selectedValue.value = value;
    isValidationEnabled.value = value == 'Yes';
   checkMedicalHistory.value=isValidationEnabled.value = value == 'Yes';
    Global().fileUploadValue.add(value);
  // print( Global().checkMedicalHistory);

  }
  void setSelectedValue1(String value) {
    selectedValue1.value = value;
    isValidationEnabled1.value = value == 'Yes';
    Global().fileUploadValue.add(value);

  }

  void toggleValidationRequirement() {
    isValidationEnabled.value =!isValidationEnabled.value; // Toggle validation requirement
  }
}

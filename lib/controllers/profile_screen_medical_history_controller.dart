import 'package:get/get.dart';

class ProfileScreenMedicalHistoryController extends GetxController {
  var selectedValue = ''.obs;
  var isValidationEnabled = true.obs;

  void setSelectedValue(String value) {
    selectedValue.value = value;
    isValidationEnabled.value = value == 'Yes'; // Set validation enabled based on the selection
  }

  void toggleValidationRequirement() {
    isValidationEnabled.value =!isValidationEnabled.value; // Toggle validation requirement
  }
}

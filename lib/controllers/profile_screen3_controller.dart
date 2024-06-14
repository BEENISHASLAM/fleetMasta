import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreenExperienceController extends GetxController {
  // Create the TextEditingController

  var selectedValue = ''.obs;
  var selectedDriverLicenceNo = ''.obs;
  var selectedTachoCardNo = ''.obs;
  var selectedCpcCardNo = ''.obs;
  var isValidationEnabled = true.obs;
  var isValidationEnabledDriverLicenceNo = true.obs;
  var isValidationEnabledTachCardNo = true.obs;
  var isValidationCpcCardNo = true.obs;
  void setSelectedValue(String value) {
    selectedValue.value = value;
    isValidationEnabled.value = value == 'Yes';
  }
  void setSelectedValueDriverLicence(String value) {
    selectedDriverLicenceNo.value = value;
    isValidationEnabledDriverLicenceNo.value = value == 'Yes';
  }
  void setSelectedValueTachoCardNo(String value) {
    selectedTachoCardNo.value = value;
    isValidationEnabledTachCardNo.value = value == 'Yes';
  }
  void setSelectedValueCpcCard(String value) {
    selectedCpcCardNo.value = value;
    isValidationCpcCardNo.value = value == 'Yes';
  }


}

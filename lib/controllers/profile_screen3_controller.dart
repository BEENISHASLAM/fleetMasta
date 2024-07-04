import 'package:fleetmasta/config/global.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreenExperienceController extends GetxController {
  // Create the TextEditingController

  var selectedValue = ''.obs;
  var selectedDriverLicenceNo = ''.obs;
  var selectedTachoCardNo = ''.obs;
  var selectedCpcCardNo = ''.obs;
  var selectedValueProof = ''.obs;
  var isValidationEnabled = true.obs;
  var isValidationEnabledDriverLicenceNo = true.obs;
  var isValidationEnabledTachCardNo = true.obs;
  var isValidationCpcCardNo = true.obs;
  var isValidationProofP45 = true.obs;
  void setSelectedValue(String value) {
    selectedValue.value = value;
    isValidationEnabled.value = value == 'Yes';
    Global().fileUploadValue.add(value);
  }
  void setSelectedValueDriverLicence(String value) {
    selectedDriverLicenceNo.value = value;
    isValidationEnabledDriverLicenceNo.value = value == 'Yes';
    Global().fileUploadValue.add(value);
  }
  void setSelectedValueTachoCardNo(String value) {
    selectedTachoCardNo.value = value;
    isValidationEnabledTachCardNo.value = value == 'Yes';
    Global().fileUploadValue.add(value);
  }
  void setSelectedValueCpcCard(String value) {
    selectedCpcCardNo.value = value;
    isValidationCpcCardNo.value = value == 'Yes';
    Global().fileUploadValue.add(value);
  }
 void setSelectedValueProofP45(String value) {
   selectedValueProof.value = value;
    isValidationProofP45.value = value == 'Yes';
   Global().fileUploadValue.add(value);

  }


}

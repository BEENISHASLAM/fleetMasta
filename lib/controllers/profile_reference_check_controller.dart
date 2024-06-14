import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileReferenceCheckController extends GetxController {
  var selectedValue = ''.obs;
  var isValidationEnabled = true.obs;
  void setSelectedValue(String value) {
    selectedValue.value = value;
    isValidationEnabled.value = value == 'Yes';
  }

}

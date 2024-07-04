import 'package:fleetmasta/config/global.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreenPaymentInfoController extends GetxController {


  var selectedValue = ''.obs;
  var isValidationEnabled = true.obs;
  void setSelectedValue(String value) {
    selectedValue.value = value;
    isValidationEnabled.value = value == 'Yes';
    Global().fileUploadValue.add(value);
  }



}

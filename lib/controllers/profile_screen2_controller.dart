import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileHomeController extends GetxController {
   // Create the TextEditingController
   TextEditingController emailController = TextEditingController();
   var selectedValue = ''.obs;
   var isValidationEnabledRightToWork = true.obs;
   void setSelectedValue(String value) {
      selectedValue.value = value;
      isValidationEnabledRightToWork.value = value == 'Yes';
   }

   @override
   void onInit() {
      super.onInit();
      // Set the initial text
      emailController.text = "User@example.com";
   }

   @override
   void onClose() {
      // Dispose of the controller when not needed
      emailController.dispose();
      super.onClose();
   }
}

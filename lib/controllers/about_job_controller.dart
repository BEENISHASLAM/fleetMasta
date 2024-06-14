import 'package:flutter/material.dart';
import 'package:get/get.dart';
class AboutJobController extends GetxController {
  TextEditingController jobTitle = TextEditingController();
  TextEditingController jobType = TextEditingController();
  TextEditingController typeOfContract = TextEditingController();
  TextEditingController  paymentStructure= TextEditingController();
  TextEditingController currency = TextEditingController();
  TextEditingController annualSalary = TextEditingController();
  TextEditingController employmentStartDate = TextEditingController();
  TextEditingController employmentEndDate = TextEditingController();
  TextEditingController noticePeriod = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    // Set the initial text
    jobTitle.text = "Full time";
    typeOfContract.text="Permanent";
    paymentStructure.text="Daily";
    currency.text="GBP";
    noticePeriod.text="abcd";
    employmentStartDate.text="Permanent";
    annualSalary.text="100000";
    employmentEndDate.text="2024-02-05";
    employmentStartDate.text="2024-02-05";


  }

  @override
  void onClose() {
    // Dispose of the controller when not needed
    jobTitle.dispose();
    super.onClose();
  }
}

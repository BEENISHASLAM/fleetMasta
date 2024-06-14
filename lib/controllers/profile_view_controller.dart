import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileViewController extends GetxController {
  var currentTabTitle = 'Personal information'.obs;
  final List<String> categories = [
    'Personal information',
    'Home address',
    'Experience & Driver s information',
    'About the job',
    'Medical history',
    'Background check',
    'Payment information',
    'Emergency contact',
    'Reference check',
    'Upload evidence'
  ];

  final Map<String, List<Map<String, String>>> categoryDetails = {
    'Personal information': [
      {'label': 'Employee ID', 'value': '345678-2'},
      {'label': 'Full name', 'value': 'Jerry Ken'},
      {'label': 'DOB', 'value': '08-Jan-1995'},
      {'label': 'Nationality', 'value': 'xyz'},
      {'label': 'Marital status', 'value': 'Married'},
    ],
    'Home address': [
      {'label': 'Address', 'value': '123 Main Street'},
      {'label': 'City', 'value': 'Anytown'},
      {'label': 'State', 'value': 'Anystate'},
      {'label': 'Zip Code', 'value': '12345'},
    ],
    'Experience & Driver s information': [
      {'label': 'Experience', 'value': '5 years'},
      {'label': 'License Number', 'value': 'AB123456'},
      {'label': 'License Expiry', 'value': '08-Jan-2025'},
    ],
    'About the job': [
      {'label': 'Position', 'value': 'Driver'},
      {'label': 'Department', 'value': 'Transport'},
      {'label': 'Start Date', 'value': '01-Jan-2020'},
    ],
    'Medical history': [
      {'label': 'Allergies', 'value': 'None'},
      {'label': 'Medications', 'value': 'None'},
      {'label': 'Last Checkup', 'value': '01-Jan-2024'},
    ],
    'Background check': [
      {'label': 'Allergies', 'value': 'None'},
      {'label': 'Medications', 'value': 'None'},
      {'label': 'Last Checkup', 'value': '01-Jan-2024'},
    ], 'Payment information': [
      {'label': 'Allergies', 'value': 'None'},
      {'label': 'Medications', 'value': 'None'},
      {'label': 'Last Checkup', 'value': '01-Jan-2024'},
    ], 'Payment information': [
      {'label': 'Allergies', 'value': 'None'},
      {'label': 'Medications', 'value': 'None'},
      {'label': 'Last Checkup', 'value': '01-Jan-2024'},
    ],'Emergency contact': [
      {'label': 'Allergies', 'value': 'None'},
      {'label': 'Medications', 'value': 'None'},
      {'label': 'Last Checkup', 'value': '01-Jan-2024'},
    ],'Reference check': [
      {'label': 'Allergies', 'value': 'None'},
      {'label': 'Medications', 'value': 'None'},
      {'label': 'Last Checkup', 'value': '01-Jan-2024'},
    ],
  };

  var selectedIndex = 0.obs;
  late PageController pageController;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: selectedIndex.value);
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
    currentTabTitle.value = categories[0];
  }

  // void selectCategory(int index) {
  //   selectedIndex.value = index;
  //   pageController.jumpToPage(index);
  //   currentTabTitle.value = categories[index];
  // }
  void selectCategory(int index) {
    selectedIndex.value = index;
    currentTabTitle.value = categories[index];
  }
  void onPageChanged(int index) {
    selectedIndex.value = index;
    currentTabTitle.value = categories[index];
  }
}






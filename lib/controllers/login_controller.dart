import 'package:fleetmasta/controllers/check_box_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var checkboxController = Get.put(CheckboxController());
  final GlobalKey<FormState> formGlobalKey = GlobalKey();

  @override
  void onInit() {
    super.onInit();
    loadCredentials();
  }

  void login() async {
    print("login");
    if (formGlobalKey.currentState!.validate()) {
    if (checkboxController.isChecked.value) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('email', emailController.text);
      await prefs.setString('password', passwordController.text);
    }
    Get.toNamed('/resetPassScreen');
  }}

  void loadCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (checkboxController.isChecked.value) {
      emailController.text = prefs.getString('email') ?? '';
      passwordController.text = prefs.getString('password') ?? '';
    }
  }
}

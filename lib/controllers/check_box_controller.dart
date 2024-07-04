import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
class CheckboxController extends GetxController {
  var isChecked = false.obs;
  var isChecked1 = false.obs;

  @override
  void onInit() {
    super.onInit();
   // loadRememberMe();
  }

  void toggleCheckbox(bool? value) {
    isChecked.value = value ?? false;
      saveRememberMe();
  }
  void toggleCheckbox1(bool? value) {
    isChecked1.value = value ?? false;

  }

  void saveRememberMe() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('remember_me',true);
  }

  void loadRememberMe() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isChecked.value = prefs.getBool('remember_me') ?? false;
  }
}











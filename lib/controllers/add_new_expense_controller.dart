import 'package:file_picker/file_picker.dart';
import 'package:fleetmasta/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
class AddNewExpensesController extends GetxController {
  TextEditingController idController = TextEditingController();
  TextEditingController expensesDate = TextEditingController();
  final GlobalKey<FormState> formGlobalKey = GlobalKey<FormState>();
  final RxMap<String, String?> uploadedFiles = <String, String?>{}.obs;

  @override
  void onInit() {
    idController.text = 'Expense ID';
    super.onInit();
  }

  Future<void> selectExpensesDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      expensesDate.text = formattedDate;
    }
  }

  void submit() {
    if (formGlobalKey.currentState!.validate()) {
     var  allFilesUploaded = uploadedFiles.values;
      if (allFilesUploaded.isEmpty) {
        Get.snackbar(
            "Error", "Please upload file.",
          colorText: Appcolor.pink,
          backgroundColor:Colors.red,
        );
      }

      Get.snackbar("Success", "Data uploaded successfully.");
    }
  }

  void pickFile(String key) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      uploadedFiles[key] = result.files.single.name;
    } else {
      uploadedFiles[key] = null;
    }
    update(); // Notify listeners to update the UI
  }
}





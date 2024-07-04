import 'package:fleetmasta/config/global.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';

class FileUploadController extends GetxController{
  var uploadedFiles = Map<String, String?>().obs;
  var result = ''.obs;
  var isUploadEnabled = true.obs;
  var addFiles = <String>[].obs;
   pickFile(String key) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      uploadedFiles[key] = result.files.single.name;
      print(addFiles.length);
      //Global().mandatory1 = true;
      // Global().mandatory2 = true;
      // Global().mandatory3 = true;
      update();
    } else {
      uploadedFiles[key] = null;
    }
  }

  bool areAllFilesUploaded(List<String> keys) {
    for (String key in keys) {
      if (uploadedFiles[key] == null) {
        return false;
      }
    }
    return true;
  }

  bool checkAllNo() {
    return Global().fileUploadValue.every((value) => value == 'No');
  }
 void  updateValue(int index, String newValue) {
    if (index >= 0 && index < Global().fileUploadValue.length) {
      Global().fileUploadValue[index] = newValue;
    }
  }
  void updateFirstOccurrence(String currentValue, String newValue) {
    int index = Global().fileUploadValue.indexOf(currentValue);
    if (index != -1) {
      Global().fileUploadValue[index] = newValue;
    }
  }
  void updateFirstYesToNo() {
    int index = Global().fileUploadValue.indexOf('Yes');
    if (index != -1) {
      Global().fileUploadValue[index] = 'No';
    }
  }


}





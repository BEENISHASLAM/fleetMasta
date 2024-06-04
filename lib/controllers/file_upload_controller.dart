import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';

class FileUploadController extends GetxController {
  var uploadedFiles = Map<String, String?>().obs;

  void pickFile(String key) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      uploadedFiles[key] = result.files.single.name;
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
}

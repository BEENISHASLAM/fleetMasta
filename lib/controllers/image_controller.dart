import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerController extends GetxController {
  var selectedImagePath = ''.obs;

  void pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      selectedImagePath.value = image.path;
    }
  }

  bool isImageSelected() {
    if (selectedImagePath.value.isEmpty) {
      Get.snackbar("Error", "Please select an image");
      return false;
    }
    return true;
  }
}


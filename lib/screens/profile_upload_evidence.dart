import 'package:dotted_border/dotted_border.dart';
import 'package:fleetmasta/components/logout_popup.dart';
import 'package:fleetmasta/components/profile_popup.dart';
import 'package:fleetmasta/components/slider.dart';
import 'package:fleetmasta/const/colors.dart';
import 'package:fleetmasta/const/custom_button.dart';
import 'package:fleetmasta/const/custom_text.dart';
import 'package:fleetmasta/controllers/file_upload_controller.dart';
import 'package:fleetmasta/controllers/profile_background_check_controller.dart';
import 'package:fleetmasta/controllers/profile_controller.dart';
import 'package:fleetmasta/controllers/profile_screen2_controller.dart';
import 'package:fleetmasta/controllers/profile_screen3_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileUploadDocumentsScreen extends StatelessWidget {
  ProfileController controller = Get.put(ProfileController());
  FileUploadController uploadEvidenceFileController = Get.put(FileUploadController());
  ProfileScreenExperienceController ProfileExpDriverController = Get.put(ProfileScreenExperienceController());
  SliderController sliderController = Get.put(SliderController());
  ProfileScreenBgCheckController profileBgCheckController = Get.put(ProfileScreenBgCheckController());
  ProfileHomeController profileHomeController = Get.put(ProfileHomeController());

  ProfileUploadDocumentsScreen({Key? key}) : super(key: key);
  final List<String> mandatoryFiles = [
    'proof_of_id',
    'right_to_work',
    'proof_of_address',
    'front_drivers_license',
    'back_drivers_license',
    'proof_of_p45',
    'licence_verification_check',
    'front_tacho_card',
    'back_tacho_card',
    'front_cpc_card',
    'back_cpc_card',
    'background_check',
    'drug_alcohol_test',
    'additional_background_check'
  ];
  final List<String> fileKeys = [
    'proof_of_id',
    'right_to_work',
    'proof_of_address',
    'front_drivers_license',
    'back_drivers_license',
    'proof_of_p45',
    'licence_verification_check',
    'front_tacho_card',
    'back_tacho_card',
    'front_cpc_card',
    'back_cpc_card',
    'background_check',
    'drug_alcohol_test',
    'additional_background_check'
  ];

  void _handleBackNavigation(BuildContext context) {
    sliderController.updateSliderValue(sliderController.currentSliderValue.value - 1);
    Navigator.pop(context);
  }

  void _handleNextNavigation(BuildContext context) {
    int mandatoryFilesCount = mandatoryFiles.length;

    // Count how many mandatory files are actually uploaded
    int uploadedMandatoryFilesCount = mandatoryFiles.where((fileKey) => uploadEvidenceFileController.uploadedFiles[fileKey]?.isNotEmpty?? false).length;

    // Check if all mandatory files are uploaded
    if (uploadedMandatoryFilesCount >= mandatoryFilesCount) {
      Get.toNamed('/profileConfirmationScreen');
    } else {
      Get.snackbar(
        'Error',
        'Please upload all required documents.',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Appcolor.purple,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              _handleBackNavigation(context);
                            },
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Image.asset('assets/images/back_arrow.png'),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.account_circle, color: Colors.white),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return ProfilePopup(
                                    onProfileTap: () {
                                      Get.toNamed('/viewProfileScreen');
                                    },
                                    onLogoutTap: () {
                                      Navigator.of(context).pop(); // Close ProfilePopup
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return LogoutPopup(
                                            onConfirmLogout: () {
                                              Get.toNamed('/loginScreen');
                                            },
                                            onCancel: () {
                                              Navigator.of(context).pop(); // Close LogoutPopup
                                            },
                                          );
                                        },
                                      );
                                    },
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                      CustomSlider(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: whiteText('Step 10/10'),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      heading('Profile'),
                      const SizedBox(height: 20,),
                    ],
                  ),
                ),
                SizedBox(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Appcolor.bg,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          const SizedBox(height: 20,),
                          headingContainer("Upload evidence", 200, 40),
                          const SizedBox(height: 20,),
                          Container(
                            decoration: BoxDecoration(
                              color: Appcolor.bbg1,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  const SizedBox(height: 20,),
                                  Obx(() => UploadCard(
                                    title: 'Upload proof of ID (passport or Driver’s license)',
                                    filename: uploadEvidenceFileController.uploadedFiles['proof_of_id'],
                                    onFilePick: () => uploadEvidenceFileController.pickFile('proof_of_id'),
                                    isEditable: true // Example method call
                                  )),
                                  SizedBox(height: 20,),
                                  Obx(() => UploadCard(
                                    title: 'Upload right to work (Passport or work permit)',
                                    filename: uploadEvidenceFileController.uploadedFiles['right_to_work'],
                                    onFilePick: () => uploadEvidenceFileController.pickFile('right_to_work'),
                                    isEditable: profileHomeController.isValidationEnabledRightToWork.value, // Example method call
                                  )),
                                  SizedBox(height: 20,),
                                 Obx(() => UploadCard(
                                    title: 'Upload proof of address\n(Utility bill, bank statement)',
                                    filename: uploadEvidenceFileController.uploadedFiles['proof_of_address'],
                                    onFilePick: () => uploadEvidenceFileController.pickFile('proof_of_address'),
                                    isEditable: true
                                 )),
                                  SizedBox(height: 20,),
                                  Obx(() => UploadCard(
                                    title: 'Upload front of driver\'s licence',
                                    filename: uploadEvidenceFileController.uploadedFiles['front_drivers_license'],
                                    onFilePick: () => uploadEvidenceFileController.pickFile('front_drivers_license'),
                                    isEditable: ProfileExpDriverController.isValidationEnabledDriverLicenceNo.value, // Example method call
                                  )), const SizedBox(height: 20,),
                                  Obx(() => UploadCard(
                                    title: 'Upload back of driver\'s licence',
                                    filename: uploadEvidenceFileController.uploadedFiles['back_drivers_license'],
                                    onFilePick: () => uploadEvidenceFileController.pickFile('back_drivers_license'),
                                    isEditable: ProfileExpDriverController.isValidationEnabledDriverLicenceNo.value, // Example method call
                                  )), const SizedBox(height: 20,),
                                  Obx(() => UploadCard(
                                    title: 'Upload proof of P45',
                                    filename: uploadEvidenceFileController.uploadedFiles['proof_of_p45'],
                                    onFilePick: () => uploadEvidenceFileController.pickFile('proof_of_p45'),
                                    isEditable: true // Example method call
                                  )), const SizedBox(height: 20,),
                                  Obx(() => UploadCard(
                                      title: 'Upload licence verification check',
                                      filename: uploadEvidenceFileController.uploadedFiles['Upload licence verification check'],
                                      onFilePick: () => uploadEvidenceFileController.pickFile('Upload licence verification check'),
                                      isEditable: true // Example method call
                                  )), const SizedBox(height: 20,),
                                  Obx(() => UploadCard(
                                    title: 'Upload front of your tacho card',
                                    filename: uploadEvidenceFileController.uploadedFiles['front_tacho_card'],
                                    onFilePick: () => uploadEvidenceFileController.pickFile('front_tacho_card'),
                                    isEditable: ProfileExpDriverController.isValidationEnabledTachCardNo.value, // Example method call
                                  )),  const SizedBox(height: 20,),Obx(() => UploadCard(
                                    title: 'Upload back of your tacho card',
                                    filename: uploadEvidenceFileController.uploadedFiles['back_tacho_card'],
                                    onFilePick: () => uploadEvidenceFileController.pickFile('back_tacho_card'),
                                    isEditable: ProfileExpDriverController.isValidationEnabledTachCardNo.value, // Example method call
                                  )),
                                  const SizedBox(height: 20,),
                                  Obx(() => UploadCard(
                                    title: 'Upload front of your CPC card',
                                    filename: uploadEvidenceFileController.uploadedFiles['front_cpc_card'],
                                    onFilePick: () => uploadEvidenceFileController.pickFile('front_cpc_card'),
                                    isEditable: ProfileExpDriverController.isValidationCpcCardNo.value, // Example method call
                                  )), const SizedBox(height: 20,),
                                  Obx(() => UploadCard(
                                    title: 'Upload back of your CPC card',
                                    filename: uploadEvidenceFileController.uploadedFiles['back_cpc_card'],
                                    onFilePick: () => uploadEvidenceFileController.pickFile('back_cpc_card'),
                                    isEditable: ProfileExpDriverController.isValidationCpcCardNo.value, // Example method call
                                  )), const SizedBox(height: 20,),
                                  Obx(() => UploadCard(
                                    title: 'Upload background check',
                                    filename: uploadEvidenceFileController.uploadedFiles['background_check'],
                                    onFilePick: () => uploadEvidenceFileController.pickFile('background_check'),
                                    isEditable: profileBgCheckController.isValidationEnabledBgCheck.value, // Example method call
                                  )), const SizedBox(height: 20,),
                                  Obx(() => UploadCard(
                                    title: 'Upload drug and alcohol test',
                                    filename: uploadEvidenceFileController.uploadedFiles['drug_alcohol_test'],
                                    onFilePick: () => uploadEvidenceFileController.pickFile('drug_alcohol_test'),
                                    isEditable: true,
                                  )),
                                  const SizedBox(height: 20,),
                                  Obx(() => UploadCard(
                                    title: 'Upload additional background check',
                                    filename: uploadEvidenceFileController.uploadedFiles['additional_background_check'],
                                    onFilePick: () => uploadEvidenceFileController.pickFile('additional_background_check'),
                                    isEditable: true,
                                  )),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 25,),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                            child: CustomButton(text: 'Next', onPressed: () {
                              Get.toNamed('/profileConfirmationScreen');
                            }),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _getTitleForKey(String key) {
    switch (key) {
      case 'proof_of_id':
        return 'Upload proof of ID (passport or Driver’s license)';
      case 'right_to_work':
        return 'Upload right to work (Passport or work permit)';
      case 'proof_of_address':
        return 'Upload proof of address\n(Utility bill, bank statement)';
      case 'front_drivers_license':
        return 'Upload front of driver\'s licence';
      case 'back_drivers_license':
        return 'Upload back of driver\'s licence';
      case 'proof_of_p45':
        return 'Upload proof of P45';
      case 'licence_verification_check':
        return 'Upload licence verification check';
      case 'front_tacho_card':
        return 'Upload front of your tacho card';
      case 'back_tacho_card':
        return 'Upload back of your tacho card';
      case 'front_cpc_card':
        return 'Upload front of your CPC card';
      case 'back_cpc_card':
        return 'Upload back of your CPC card';
      case 'background_check':
        return 'Upload background check';
      case 'drug_alcohol_test':
        return 'Upload drug and alcohol test';
      case 'additional_background_check':
        return 'Upload additional background check';
      default:
        return 'Upload file';
    }
  }
}

class UploadCard extends StatelessWidget {
  final String title;
  final String? filename;
  final VoidCallback onFilePick;
  final bool isEditable; // Add this line

  UploadCard({
    required this.title,
    this.filename,
    required this.onFilePick,
    this.isEditable = true, // Default value set to true
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Column(
        children: [
          Container(
            width: 120,
            child: Align(
              alignment: Alignment.center,
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: title,
                      style: TextStyle(
                        color: Appcolor.lightBlack,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text: '*',
                      style: TextStyle(
                        color: Appcolor.purple,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 10,),
          DottedBorder(
            color: Appcolor.grey, // Color of the border
            strokeWidth: 2, // Width of the border
            dashPattern: [6, 3], // Pattern of the dashed border
            borderType: BorderType.Rect, // Border type
            radius: const Radius.circular(12),
            child: GestureDetector(
              onTap: isEditable? onFilePick : null,
              child: Container(
                width: 140,
                height: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0),
                    color: Appcolor.white
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.cloud_upload_outlined,
                      size: 40,
                      color: Appcolor.grey,
                    ),
                    const SizedBox(height: 5,),
                    Text(
                      filename != null ? filename! : 'Choose file to upload',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        color: Appcolor.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}










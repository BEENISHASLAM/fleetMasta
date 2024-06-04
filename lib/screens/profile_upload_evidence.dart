import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fleetmasta/components/logout_popup.dart';
import 'package:fleetmasta/controllers/file_upload_controller.dart';
import 'package:flutter/material.dart';
import 'package:fleetmasta/components/profile_popup.dart';
import 'package:fleetmasta/components/slider.dart';
import 'package:fleetmasta/const/colors.dart';
import 'package:fleetmasta/const/custom_button.dart';
import 'package:fleetmasta/const/custom_text.dart';
import 'package:fleetmasta/controllers/profile_controller.dart';
import 'package:get/get.dart';

class ProfileUploadDocumentsScreen extends StatelessWidget {
  ProfileController controller = Get.put(ProfileController());
  FileUploadController uploadEvidenceFileController = Get.put(FileUploadController());
  final SliderController sliderController = Get.find();
  ProfileUploadDocumentsScreen({Key? key}) : super(key: key);
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
    if (uploadEvidenceFileController.areAllFilesUploaded(fileKeys)) {
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
        body:SingleChildScrollView(
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
                        const SizedBox(height:10,),
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
                              icon: const Icon(Icons.account_circle,color: Colors.white),
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
                        // SizedBox(height: height * 0.02), // 2% of screen height
                        CustomSlider(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: whiteText('Step 10/10')),
                        ),
                        const SizedBox(height: 20,),
                        heading('Profile'),
                        const SizedBox(height: 20,),
                      ],
                    ),
                  ),
                  //SizedBox(height: height * 0.03), // 3% of screen height
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
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child:Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    const SizedBox(height: 20,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                      UploadCard(
                                        onFilePick: () =>uploadEvidenceFileController.pickFile("proof_of_id"),
                                        title: 'Upload proof of ID (passport or Driver’s license)',),
                                      UploadCard(
                                        onFilePick:() => uploadEvidenceFileController.pickFile("right_to_work"),
                                        title: 'Upload right to work (Passport or work permit)',),
                                    ],),
                                    const SizedBox(height: 20,),
                                    Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        UploadCard(
                                          onFilePick:() => uploadEvidenceFileController.pickFile("proof_of_addres"),
                                          title: 'Proof of address\n(Utility bill, bank statement',),
                                        UploadCard(
                                          onFilePick: () =>uploadEvidenceFileController.pickFile("front_drivers_license"),
                                          title: 'Front of driver\'s licence',),
                                      ],),
                                    const SizedBox(height: 20,),
                                    Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        UploadCard(
                                          onFilePick:() => uploadEvidenceFileController.pickFile("back_drivers_licens"),
                                          title: 'Back of driver\'s licence',),
                                        UploadCard(
                                          onFilePick: () =>uploadEvidenceFileController.pickFile("proof_of_p45"),
                                          title: 'Proof of P45',),
                                      ],),
                                    const SizedBox(height: 20,),
                                    Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        UploadCard(
                                          onFilePick:() => uploadEvidenceFileController.pickFile("licence_verification_check"),
                                          title: 'Licence verification check',),
                                        UploadCard(
                                          onFilePick:() => uploadEvidenceFileController.pickFile("front_tacho_card"),
                                          title: 'Front of your tacho card',),
                                      ],),
                                    const SizedBox(height: 20,),
                                    Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        UploadCard(
                                          onFilePick:() => uploadEvidenceFileController.pickFile("back_tacho_card"),
                                          title: 'Back of your tacho card',),
                                        UploadCard(
                                            onFilePick:() => uploadEvidenceFileController.pickFile("front_cpc_card"),
                                            title: 'Front of your CPC card')
                                      ],),
                                    const SizedBox(height: 20,),
                                    Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        UploadCard(
                                          onFilePick: () =>uploadEvidenceFileController.pickFile("back_cpc_card"),
                                          title: 'Back of your CPC card',),
                                        UploadCard(
                                          onFilePick:() => uploadEvidenceFileController.pickFile("background_check"),
                                          title: 'Background check',),
                                      ],),
                                    const SizedBox(height: 20,),
                                        Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        UploadCard(
                                          onFilePick:() => uploadEvidenceFileController.pickFile("drug_alcohol_test"),
                                          title: 'Drug and Alcohol test',),
                                        UploadCard(title: 'Background check',
                                          onFilePick:() => uploadEvidenceFileController.pickFile('additional_background_check'),),
                                      ],),
                                    const SizedBox(height: 20,),

                                  ],
                                ),
                              )
                            ),
                            const SizedBox(height: 25,),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10,  horizontal: 10),
                              child: CustomButton(text: 'Next', onPressed: () {
                                _handleNextNavigation(context);
                              }),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),

      ),
    );
  }
}



class UploadCard extends StatelessWidget {
  final String title;
  final String? filename;
  final double? progress;
  final bool isUploaded;
  final VoidCallback onFilePick;

  UploadCard({
    required this.title,
    this.filename,
    this.progress,
    this.isUploaded = false,
    required this.onFilePick,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child:Column(
        children: [
          Container(
            width: 130,
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
          const SizedBox(height: 10,),
          DottedBorder(
            color:Appcolor.grey,// Color of the border
            strokeWidth: 2,   // Width of the border
            dashPattern: [6, 3], // Pattern of the dashed border
            borderType: BorderType.Rect, // Border type
            radius: const Radius.circular(12),
            child: GestureDetector(
              onTap:onFilePick,
              child: Container(
                width: 130,
                height: 90,
                decoration: BoxDecoration(
                  color:Appcolor.white,
                ),
                  child:Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Image.asset('assets/images/Combined-Shape.png'),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: RichText(
                    text: TextSpan(
                    children: [
                    TextSpan(
                    text: "Choose",
                    style: TextStyle(
                    color: Appcolor.purple,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    ),
                    ),
                    TextSpan(
                    text: ' file to upload',
                    style: TextStyle(
                    color: Appcolor.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    ),
                    ),
                    ],
                    ),
                    ),
                  ),
                   ],
                 )

              ),
            ),
          )

        ],
      ),
    );
  }
}
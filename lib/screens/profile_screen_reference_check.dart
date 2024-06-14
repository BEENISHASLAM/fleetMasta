import 'package:fleetmasta/components/app_menu.dart';
import 'package:fleetmasta/components/custom_dropdown.dart';
import 'package:fleetmasta/components/custom_txtbox.dart';
import 'package:fleetmasta/components/custom_tab.dart';
import 'package:fleetmasta/components/logout_popup.dart';
import 'package:fleetmasta/components/profile_popup.dart';
import 'package:fleetmasta/components/slider.dart';
import 'package:fleetmasta/const/colors.dart';
import 'package:fleetmasta/const/custom_button.dart';
import 'package:fleetmasta/const/custom_text.dart';
import 'package:fleetmasta/const/form_validation.dart';
import 'package:fleetmasta/controllers/profile_controller.dart';
import 'package:fleetmasta/controllers/profile_reference_check_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreenReferenceCheck extends StatelessWidget {
  ProfileController controller = Get.put(ProfileController());
  ProfileReferenceCheckController profileController = Get.put(ProfileReferenceCheckController());
  final SliderController sliderController = Get.find();
  ProfileScreenReferenceCheck({Key? key}) : super(key: key);
  final GlobalKey<FormState> globalKey = GlobalKey();
  void _handleBackNavigation(BuildContext context) {
    sliderController.updateSliderValue(sliderController.currentSliderValue.value - 1);
    Navigator.pop(context);
  }
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
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
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height:10,),
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
                              icon: Icon(Icons.account_circle,color: Colors.white),
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
                              child: whiteText('Step 9/10')),
                        ),
                        SizedBox(height: 20,),
                        heading('Profile'),
                        SizedBox(height: 20,),
                      ],
                    ),
                  ),
                  //SizedBox(height: height * 0.03), // 3% of screen height
                  SizedBox(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Appcolor.bg,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            SizedBox(height: 20,),
                           headingContainer("Reference check", 200,40),
                            SizedBox(height: 20,),
                            Container(
                              // height: 200,
                              decoration: BoxDecoration(
                                  color: Appcolor.bbg1,
                                  borderRadius: BorderRadius.circular(10)
                              ),child:Form(
                              key: globalKey,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 10),
                                          child: RichText(
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: 'Do you have previous employment?',
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
                                        SizedBox(height: 8,),
                                        Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: CustomDropdown(
                                            validator: (value) {
                                              if (value == null || value.isEmpty) {
                                                return '';
                                              }
                                              return null;
                                            },
                                              text: "Select",
                                              items: ['Yes','No'],
                                            onChanged: (String? newValue) {
                                              if (newValue!= null) {
                                                profileController.setSelectedValue(newValue);// Toggle validation requirement
                                              }
                                            },

                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 10),
                                          child: RichText(
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: 'Last company worked for',
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
                                       SizedBox(height: 5,),
                                        Obx(() =>CustomTextBox(
                                            onValidate: profileController.isValidationEnabled.value
                                                ? (value) {
                                              return HelperFunction.checkFirstName(value);}
                                                : null,
                                            hintText: '')),
                                      ],
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                            width: screenWidth * 0.4,
                                            child:Column(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                                  child: Align(
                                                    alignment: Alignment.topLeft,
                                                    child: RichText(
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text: "Line manager at your last company",
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
                                                SizedBox(height: 5,),
                                                Obx(() =>CustomTextBox(
                                                    onValidate: profileController.isValidationEnabled.value
                                                        ? (value) {
                                                      return HelperFunction.checkFirstName(value);}
                                                        : null,
                                                    hintText: '')),
                                              ],
                                            )

                                        ),
                                        SizedBox(
                                            width: screenWidth * 0.4,
                                            child:Column(children: [
                                              Padding(
                                                padding: EdgeInsets.symmetric(horizontal:18),
                                                child: Align(
                                                  alignment: Alignment.topLeft,
                                                  child: RichText(
                                                    text: TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text: "Email of line manager",
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
                                              SizedBox(height: 5,),
                                              Obx(() =>CustomTextBox(
                                                  onValidate: profileController.isValidationEnabled.value
                                                      ? (value) {
                                                    return HelperFunction.checkFirstName(value);}
                                                      : null,
                                                  hintText: '')),
                                            ],)
                                        ),
                                      ],
                                    ),
                                  ),Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                            width: screenWidth * 0.4,
                                            child:Column(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                                  child: Align(
                                                    alignment: Alignment.topLeft,
                                                    child: RichText(
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text: "Phone number of line manager",
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
                                                Obx(() =>CustomTextBox(
                                                    onValidate: profileController.isValidationEnabled.value
                                                        ? (value) {
                                                      return HelperFunction.checkFirstName(value);}
                                                        : null,
                                                    hintText: '')),
                                              ],
                                            )

                                        ),
                                        SizedBox(
                                            width: screenWidth * 0.4,
                                            child:Column(children: [
                                              Padding(
                                                padding: EdgeInsets.symmetric(horizontal:20),
                                                child: Align(
                                                  alignment: Alignment.topLeft,
                                                  child: RichText(
                                                    text: TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text: "Position you held at your last company",
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
                                              Obx(() =>CustomTextBox(
                                                  onValidate: profileController.isValidationEnabled.value
                                                      ? (value) {
                                                    return HelperFunction.checkFirstName(value);}
                                                      : null,
                                                  hintText: '')),
                                            ],)
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 10),
                                          child: RichText(
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: 'Are you happy for us to contact your last employer?',
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
                                        SizedBox(height: 8,),
                                        Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child:
                                          Obx(() => CustomDropdown(
                                            validator: profileController.isValidationEnabled.value
                                                ? (value) {
                                              if (value == null || value.isEmpty) {
                                                return '';
                                              }
                                              return null;
                                            }
                                                : null,
                                            text: "Select",
                                            items: ['Yes', 'No'],
                                          ))
                                        ),
                                      ],
                                    ),
                                  ),

                                 ],
                              ),
                            ),
                            ),
                            SizedBox(height: 25,),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10,  horizontal: 10),
                              child: CustomButton(text: 'Next', onPressed: () {
                              if (globalKey.currentState!.validate()) {
                                sliderController.updateSliderValue(
                                    sliderController.currentSliderValue.value +
                                        1);
                                Get.toNamed('/profileUploadDoc');
                              }}),
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

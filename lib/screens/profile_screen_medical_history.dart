import 'package:fleetmasta/components/app_menu.dart';
import 'package:fleetmasta/components/custom_dropdown.dart';
import 'package:fleetmasta/components/custom_txtbox.dart';
import 'package:fleetmasta/components/custom_tab.dart';
import 'package:fleetmasta/components/logout_popup.dart';
import 'package:fleetmasta/components/notification_popup.dart';
import 'package:fleetmasta/components/profile_popup.dart';
import 'package:fleetmasta/components/slider.dart';
import 'package:fleetmasta/config/global.dart';
import 'package:fleetmasta/const/colors.dart';
import 'package:fleetmasta/const/custom_button.dart';
import 'package:fleetmasta/const/custom_text.dart';
import 'package:fleetmasta/const/form_validation.dart';
import 'package:fleetmasta/controllers/profile_controller.dart';
import 'package:fleetmasta/controllers/profile_screen_medical_history_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ProfileScreenMedicalHistory extends StatelessWidget {
ProfileController controller = Get.put(ProfileController());
ProfileScreenMedicalHistoryController profileController = Get.put(ProfileScreenMedicalHistoryController());
final SliderController sliderController = Get.find();
ProfileScreenMedicalHistory({Key? key}) : super(key: key);
final GlobalKey<FormState> globalKeyMedicalHistory = GlobalKey();
void _handleBackNavigation(BuildContext context) {
sliderController.updateSliderValue(sliderController.currentSliderValue.value - 1);
Navigator.pop(context);
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
                Row(children: [
                  IconButton(
                    icon: SvgPicture.asset('assets/icons/alert.svg'),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return NotificationPopup(onAllNotificationTap: () {  },);
                        },
                      );
                    },
                  ),
                  IconButton(
                    icon: Image.asset("assets/images/user-thumb.png" , width: 20,color: Appcolor.white,),
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
                                      Get.toNamed('/loginScreen'); // Close LogoutPopup
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
                ],)
              ],
            ),
            // SizedBox(height: height * 0.02), // 2% of screen height
            CustomSlider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: whiteText('Step 5/10')),
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
               headingContainer("Medical history", 180, 40),
                SizedBox(height: 20,),
                Container(
                  // height: 200,
                  decoration: BoxDecoration(
                      color: Appcolor.bbg1,
                      borderRadius: BorderRadius.circular(10)
                  ),child:Form(
                  key: globalKeyMedicalHistory,
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
                                      text: 'Do you have any medical conditions?',
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
                            SizedBox(height: 10,),
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
                                      text: 'If yes, please provide more information',
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
                      ),Padding(
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
                                      text: 'If you have any medical conditions, have you notified the relevant authority',
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
                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
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
                               onChanged: (String? newValue) {
                                 if (newValue!= null) {
                                   profileController.setSelectedValue1(newValue);// Toggle validation requirement
                                 }
                               },
                             ))),

                          ],
                        ),
                      ),Padding(
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
                                      text: 'If yes, please state the authorities you have notified',
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
                            SizedBox(height: 10,),
                            Obx(
                                  () => CustomTextBox(
                                onValidate: (profileController.isValidationEnabled.value || profileController.isValidationEnabled1.value)
                                    ? (value) {
                                  if (profileController.isValidationEnabled.value) {
                                    if (value == null || value.isEmpty) {
                                      return '';
                                    }
                                  }
                                  if (profileController.isValidationEnabled1.value) {
                                    if (value == null || value.isEmpty) {
                                      return '';
                                    }
                                  }
                                  return null;
                                }
                                    : null,
                                hintText: '',
                              ),
                            )



                          ],
                        ),
                      ),Padding(
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
                                      text: 'If you have any medical conditions, do you need to notify the relevant authority',
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
                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child:
                              Obx(() => CustomDropdown(
                                validator: profileController.isValidationEnabled.value
                                    ?
                                    (value) {
                                  if (value == null || value.isEmpty) {
                                    return '';
                                  }
                                  return null;
                                }
                                    : null,
                                text: "Select",
                                items: ['Yes', 'No'],
                              ))),
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
                                      text: 'If you have a medical condition, do you use medications that will impact your ability to drive?',
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
                            SizedBox(height: 10,),
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
                              )),
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
                                      text: 'If yes, please provide more information',
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
                        padding: EdgeInsets.all(10),
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'If you have any medical conditions, do you need to notify the relevant authority',
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
                              SizedBox(height: 10,),
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
                                  ))),

                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'If yes, please provide more details.',
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
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Have you tested your eyesight to ensure you are able to see while driving?',
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
                              SizedBox(height: 10,),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Obx(() => CustomDropdown(
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
                                ))),

                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Please provide any other information on your medical conditions here.',
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
                      ),
                    ],
                  ),
                ),
                ),
                SizedBox(height: 25,),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10,  horizontal: 10),
                  child: CustomButton(text: 'Next', onPressed: () {
                  if (globalKeyMedicalHistory.currentState!.validate()) {
                    sliderController.updateSliderValue(
                        sliderController.currentSliderValue.value + 1);
                    Get.toNamed('/ProfileScreenBgCheck');
                  }  }),
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

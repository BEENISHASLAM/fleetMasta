import 'package:fleetmasta/components/app_menu.dart';
import 'package:fleetmasta/components/custom_txtbox.dart';
import 'package:fleetmasta/components/logout_popup.dart';
import 'package:fleetmasta/components/notification_popup.dart';
import 'package:fleetmasta/components/profile_popup.dart';
import 'package:fleetmasta/components/slider.dart';
import 'package:fleetmasta/const/colors.dart';
import 'package:fleetmasta/const/custom_button.dart';
import 'package:fleetmasta/const/custom_text.dart';
import 'package:fleetmasta/controllers/date_picker_controller.dart';
import 'package:fleetmasta/controllers/profile_screen3_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../components/custom_dropdown.dart';
import '../const/form_validation.dart';

class ProfileScreen3 extends StatelessWidget {
  DatePickerController controller = Get.put(DatePickerController());
  ProfileScreenExperienceController profileController = Get.put(ProfileScreenExperienceController());
  final SliderController sliderController = Get.find();
  ProfileScreen3({Key? key}) : super(key: key);
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
                              child: whiteText('Step 3/10')),
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
                            headingContainer("Experience & driver's information", 300, 40),
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
                                                    text: 'How many years experience do you have in the job you have applied for',
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
                                          CustomTextBox(
                                              onValidate:(str){
                                                return HelperFunction.checkFirstName(str);
                                              },
                                            controller: null,
                                              obscureText:  false,
                                              hintText: ''),
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
                                                    text: 'Do you have another employment in parallel to this?',
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
                                               items: ["Yes", "No"],
                                             onChanged: (String? newValue) {
                                               if (newValue != null) {
                                                 profileController.setSelectedValue(newValue);
                                               }
                                             },
                                           ),
                                         )
                                        ],
                                      ),
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
                                                    fontSize:14,
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
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 10),
                                          child: RichText(
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: 'Do you have P45 from previous employer?',
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
                                         child:CustomDropdown(
                                             validator: (value) {
                                               if (value == null || value.isEmpty) {
                                                 return '';
                                               }
                                               return null;
                                             },
                                           text: 'Select',
                                             items: ['Yes', 'No'],
                                           onChanged: (String? newValue) {
                                             if (newValue != null) {
                                               profileController.setSelectedValueProofP45(newValue);
                                             }
                                           },
                                         )),
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
                                                  text: "Do you hold a valid driver's licence?",
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
                                           text: 'Select',
                                             items: ['Yes', 'No'],
                                           onChanged: (String? newValue) {
                                             if (newValue != null) {
                                               profileController.setSelectedValueDriverLicence(newValue);
                                             }
                                           },
                                            ),
                                       )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 10),
                                          child: RichText(
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: "Driver's licence number",
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
                                            onValidate: profileController.isValidationEnabledDriverLicenceNo.value
                                                ? (value) {
                                              return HelperFunction.checkFirstName(value);}
                                                : null,
                                            hintText: '')),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal:10),
                                        child: RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: "Driver's licence Expiry Date",
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
                                        onValidate: profileController.isValidationEnabledDriverLicenceNo.value
                                            ? (value) {
                                          return HelperFunction.checkFirstName(value);
                                        }
                                            : null,
                                        controller: controller.driverLicenseExp,
                                        onPressed:() => controller.selectDateLicenceExp(context),
                                        hintText: 'mm/dd/yy',
                                        suffixIcon: IconButton(
                                          icon:SvgPicture.asset('assets/icons/calender.svg'), color: Appcolor.grey, onPressed: () {  },
                                        ),
                                      ))
                                    ],),
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
                                                  text: 'Do you hold valid tacho card',
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
                                        SizedBox(height:8,),
                                        Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: CustomDropdown(
                                            validator: (value) {
                                              if (value == null || value.isEmpty) {
                                                return '';
                                              }
                                              return null;
                                            },
                                            text: 'Select',
                                              items: ["Yes", "No"],
                                            onChanged: (String? newValue) {
                                              if (newValue != null) {
                                                profileController.setSelectedValueTachoCardNo(newValue);
                                              }
                                            },
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 10),
                                          child: RichText(
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: "Tacho card number",
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
                                            onValidate: profileController.isValidationEnabledTachCardNo.value
                                                ? (value) {
                                              return HelperFunction.checkFirstName(value);}
                                                : null,
                                            hintText: '')),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal:10),
                                        child: RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: "Tacho card Expiry Date",
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
                                            onValidate: profileController.isValidationEnabledTachCardNo.value
                                                ? (value) {
                                              return HelperFunction.checkFirstName(value);}
                                                : null,
                                            controller: controller.tachoCardExp,
                                            onPressed:() => controller.selectTechoCardExp(context),
                                            hintText: 'mm/dd/yy',
                                            suffixIcon: IconButton(
                                              icon:SvgPicture.asset('assets/icons/calender.svg'), onPressed: () {  },
                                            ) )),
                                    ],),
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
                                                    text: 'Do you hold a valid cpc card',
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
                                                text:'Select' ,
                                                items: ['Yes', 'No'],
                                              onChanged: (String? newValue) {
                                                if (newValue != null) {
                                                  profileController.setSelectedValueCpcCard(newValue);
                                                }
                                              },
                                            ),
                                          ),
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
                                                    text: 'Cpc card number',
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
                                          Obx(() =>CustomTextBox(
                                              onValidate: profileController.isValidationCpcCardNo.value
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
                                                    text: 'Cpc card expiry date',
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
                                          Obx(() => CustomTextBox(
                                            onValidate: profileController.isValidationCpcCardNo.value
                                                ? (value) {
                                              return HelperFunction.checkFirstName(value);}
                                                : null,
                                              controller: controller.cpcCardExp,
                                              onPressed:() => controller.selectCpcCardExDate(context),
                                              hintText: 'mm/dd/yy',
                                            suffixIcon: IconButton(
                                              icon:SvgPicture.asset('assets/icons/calender.svg'), color: Appcolor.grey, onPressed: () {  },
                                            )),

                                          ),
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
                               if (globalKey.currentState!.validate()) {
                                 sliderController.updateSliderValue(
                                     sliderController.currentSliderValue.value +
                                         1);
                                 Get.toNamed('/profileScreenAboutJob');
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

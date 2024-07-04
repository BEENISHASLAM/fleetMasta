
import 'package:fleetmasta/components/custom_txtbox.dart';
import 'package:fleetmasta/components/logout_popup.dart';
import 'package:fleetmasta/components/notification_popup.dart';
import 'package:fleetmasta/components/profile_popup.dart';
import 'package:fleetmasta/components/slider.dart';
import 'package:fleetmasta/const/colors.dart';
import 'package:fleetmasta/const/custom_button.dart';
import 'package:fleetmasta/const/custom_text.dart';
import 'package:fleetmasta/const/form_validation.dart';
import 'package:fleetmasta/controllers/date_picker_controller.dart';
import 'package:fleetmasta/controllers/profile_screen2_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../components/custom_dropdown.dart';

class ProfileScreen2 extends StatelessWidget {
  DatePickerController controller = Get.put(DatePickerController());
  ProfileHomeController profileController = Get.put(ProfileHomeController());
  final SliderController sliderController = Get.find();
  ProfileScreen2({Key? key}) : super(key: key);
  final GlobalKey<FormState> globalKey1 = GlobalKey();
   TextEditingController phoneController = TextEditingController();
  void _handleBackNavigation(BuildContext context) {
    sliderController.updateSliderValue(sliderController.currentSliderValue.value - 1);
    Navigator.pop(context);
  }
  @override
  Widget build(BuildContext context) {
    return
      SafeArea(
      child: Scaffold(
        body:SingleChildScrollView(
            child:
            // builder: (context, constraints) {
            //   double screenWidth = constraints.maxWidth;
            //   double height = constraints.maxHeight;
            // 2% of screen height
            Container(
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
                        SizedBox(height: 50,),
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
                              child: whiteText('Step 2/10')),
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
                        child: Form(
                          key: globalKey1,
                          child: Column(
                            children: [
                              SizedBox(height: 20,),
                              headingContainer("Home address", 120, 40),
                              SizedBox(height: 20,),
                              Container(
                                // height: 200,
                                decoration: BoxDecoration(
                                    color: Appcolor.bbg1,
                                    borderRadius: BorderRadius.circular(10)
                                ),child:Column(
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
                                                  text: 'Address line 1',
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
                                            obscureText:  false,
                                            hintText: ''),
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
                                                  text: 'Address line 2',
                                                  style: TextStyle(
                                                    color: Appcolor.lightBlack,
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
                                            obscureText:  false,
                                            hintText: ''),
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
                                                  text: 'City',
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
                                                  text: 'State/Province',
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
                                            obscureText:  false,
                                            hintText: ''),
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
                                                  text: 'Postcode',
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
                                            obscureText:  false,
                                            hintText: ''),
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
                                                  text: 'Contact Number',
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
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: IntlPhoneField(
                                  controller: phoneController,
                                    validator: (phone) {
                                      if (phone == null || phone.number.isEmpty) {
                                        return 'Please enter a phone number';
                                      }
                                      if (phone.number.length < 10) { // Assuming a minimum length of 10 digits
                                        return 'Please enter a valid phone number';
                                      }
                                      return null;
                                    },
                                  style: TextStyle(
                                      color: Appcolor.grey,
                                      fontSize: 14
                                    // Change the color here
                                  ),
                                  decoration: InputDecoration(
                                    filled: true,
                                    hintStyle: TextStyle(color: Appcolor.grey),
                                    fillColor: Appcolor.white,
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red, width: 1.0),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red, width: 2.0),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                  ),

                                ),
                                                                )
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
                                                  text: 'Email address',
                                                  style: TextStyle(
                                                    color: Appcolor.lightBlack,
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
                                          controller: profileController.emailController,
                                          readOnly: true,
                                            obscureText:  false,
                                            hintText: '',

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
                                                  text: 'National insurance number',
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
                                            obscureText:  false,
                                            hintText: ''),
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
                                                  text: 'Do you have valid passport or right to work',
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
                                                profileController.setSelectedValue(newValue);
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
                                                  text: 'Passport or right to work ID number',
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
                                      Obx(() =>  CustomTextBox(
                                          onValidate: profileController.isValidationEnabledRightToWork.value
                                              ? (value) {
                                            return HelperFunction.checkFirstName(value);}
                                              : null,
                                           obscureText:  false,
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
                                                  text: 'Passport or right to work expiry date ',
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
                                        Obx(() => CustomTextBox(
                                            onValidate: profileController.isValidationEnabledRightToWork.value ? (value) {
                                              return HelperFunction.checkFirstName(value);
                                            } : null,
                                          controller: controller.passportExpiryDate,
                                          onPressed:() => controller.selectPassportExDate(context),
                                          hintText: 'mm/dd/yy',
                                          suffixIcon: IconButton(
                                            icon:SvgPicture.asset('assets/icons/calender.svg'), color: Appcolor.grey, onPressed: () {  },
                                          )),
                                        ),
                                      ],
                                    ),
                                  ),

                                ],
                                                                 ),
                              ),
                              SizedBox(height: 25,),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 10,  horizontal: 10),
                                child: CustomButton(text: 'Next', onPressed: () {
                                  if (globalKey1.currentState!.validate()) {
                                    sliderController.updateSliderValue(
                                        sliderController.currentSliderValue
                                            .value + 1);
                                    Get.toNamed('/profileScreen3');
                                  }}),
                              ),
                            ],
                          ),
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

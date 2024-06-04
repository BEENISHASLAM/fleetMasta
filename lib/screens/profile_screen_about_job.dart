
import 'package:fleetmasta/components/custom_txtbox.dart';
import 'package:fleetmasta/components/logout_popup.dart';
import 'package:fleetmasta/components/profile_popup.dart';
import 'package:fleetmasta/components/slider.dart';
import 'package:fleetmasta/const/colors.dart';
import 'package:fleetmasta/const/custom_button.dart';
import 'package:fleetmasta/const/custom_text.dart';
import 'package:fleetmasta/const/form_validation.dart';
import 'package:fleetmasta/controllers/date_picker_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ProfileScreenAboutJob extends StatelessWidget {
  DatePickerController controller = Get.put(DatePickerController());
  final SliderController sliderController = Get.find();
  ProfileScreenAboutJob({Key? key}) : super(key: key);
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
                                                Get.toNamed('/loginScreen');  // Close LogoutPopup
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
                              child: whiteText('Step 4/10')),
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
                           headingContainer('About the job', 140, 40),
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
                                                  text: 'Job title',
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
                                          controller: null,
                                            obscureText:  false,
                                            hintText: 'abc'),
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
                                                            text: "Job type",
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
                                                ),
                                                SizedBox(height: 5,),
                                                CustomTextBox(
                                                  controller: null,
                                                hintText: 'Full time',)
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
                                                          text: "Type pf contract",
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
                                              ),
                                              SizedBox(height: 5,),
                                              CustomTextBox(
                                                controller: null,
                                                  hintText: 'Permanent'
                                              )
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
                                                  text: 'Payment structure',
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

                                          controller: null,
                                            hintText: 'Daily')
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
                                                            text: "Currency",
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
                                                ),
                                                SizedBox(height: 5,),
                                                CustomTextBox(

                                                  hintText: 'GBP',)
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
                                                          text: "Annual salary",
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
                                              ),
                                              SizedBox(height: 5,),
                                              CustomTextBox(
                                                controller: null,
                                                  hintText: '100000'
                                              )
                                            ],)
                                        ),
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
                                                    text: 'Employment Start date',
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
                                            controller: controller.empStartDate,
                                            onPressed:() => controller.selectEmpStartDate(context),
                                            hintText: 'mm/dd/yy',  suffixIcon: IconButton(
                                              icon: Icon(Icons.calendar_today, color: Appcolor.grey,
                                              ),
                                              onPressed: (){},
                                          )),
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
                                                    text: 'Employment End date',
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

                                            controller: controller.empEndDate,
                                            onPressed:() => controller.selectEmpEndDate(context),
                                            hintText: 'mm/dd/yy',  suffixIcon: IconButton(
                                            icon: Icon(Icons.calendar_today, color: Appcolor.grey,
                                            ),
                                            onPressed: (){},)),
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
                                                    text: 'Notice period',
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

                                            controller: null,
                                              hintText: ''),
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
                                  sliderController.updateSliderValue(
                                      sliderController.currentSliderValue
                                          .value + 1);
                                  Get.toNamed('/profileScreenMedicalHistory');
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

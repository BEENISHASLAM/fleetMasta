import 'package:fleetmasta/components/custom_dropdown.dart';
import 'package:fleetmasta/components/custom_txtbox.dart';
import 'package:fleetmasta/components/logout_popup.dart';
import 'package:fleetmasta/components/notification_popup.dart';
import 'package:fleetmasta/const/form_validation.dart';
import 'package:fleetmasta/const/widgets.dart';
import 'package:fleetmasta/controllers/add_new_expense_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../components/app_menu.dart';
import '../components/profile_popup.dart';
import '../const/colors.dart';
import '../const/custom_text.dart';

class AddAssetsScreen extends StatelessWidget {
final AddNewExpensesController controller = Get.put(AddNewExpensesController());

AddAssetsScreen({Key? key}) : super(key: key);

@override
Widget build(BuildContext context) {
GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
final mediaQuery = MediaQuery.of(context);
final height = mediaQuery.size.height;
final screenWidth = mediaQuery.size.width;
return SafeArea(
child: Scaffold(
key: _scaffoldKey,
drawer: CustomDrawer(
onHomeTap: () {},
onDashboardTap: () {},
onContactTap: () {},
onSettingsTap: () {},
),
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
padding: EdgeInsets.all(screenWidth * 0.025),
child: Column(
crossAxisAlignment: CrossAxisAlignment.center,
children: [
  SizedBox(height: height * 0.05),
  Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      IconButton(
        icon: const Icon(Icons.menu, color: Colors.white, size: 30),
        onPressed: () {
          _scaffoldKey.currentState?.openDrawer();
        },
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
  SizedBox(height: height * 0.02),
  Row(
    children: [
      SizedBox(width: 17,),
      Image.asset('assets/images/dashboard.png'),
      SizedBox(width: 10,),
      noraml("/Expenses")
    ],
  ),
  SizedBox(height: height * 0.02),
],
),
),
Container(
decoration: BoxDecoration(
color: Appcolor.bg,
borderRadius: BorderRadius.only(
  topLeft: Radius.circular(40),
  topRight: Radius.circular(40),
),
),
child: Padding(
padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.025),
child: Column(
  children: [
    SizedBox(height: 20,),
    Row(
      children: [
        IconButton(
          icon: SvgPicture.asset('assets/icons/backIcon.svg'),
          onPressed: () {
            Get.back();},
        ),
        SizedBox(width: 90,),
        lightBack( "Add new expenses "),
      ]),
        SizedBox(height: 20,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Form(
            key:controller.formGlobalKey,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Appcolor.bbg1,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Expenses ID ',
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
                              readOnly: true,
                                onValidate:(str){
                                  return HelperFunction.checkFirstName(str);
                                },
                                controller:controller.idController,
                                obscureText: false,
                                hintText: 'Expense Id'),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Expenses purpose ',
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
                                obscureText: false,
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
                                      text: 'Date',
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
                                controller: controller.expensesDate,
                                 onPressed:() => controller.selectExpensesDate(context),
                                hintText: 'mm/dd/yy',
                                suffixIcon: IconButton(
                                  icon:SvgPicture.asset('assets/icons/calender.svg'), color: Appcolor.grey, onPressed: () {  },
                                ),),
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
                                      text: 'Currency',
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
                                items: ['British pound sterling', ''],
                                // onChanged: (String? newValue) {
                                //   if (newValue != null) {
                                //     profileController.setSelectedValue(newValue);
                                //   }

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
                                      text: 'Description of the Expense (Please provide as much detail)',
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
                              controller:null ,
                              hintText: '',
                             ),
                          ],
                        ),
                      ), Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 5,),
                          Obx(() => UploadCard(
                              isEditable:true,
                              filename:controller.uploadedFiles['key'],
                              title: 'Please upload images as evidence if you have any.',
                              onFilePick: () { controller.pickFile('key'); },

                          )
                          )
                          ],
                        ),
                      ),

                      Align(
                        alignment: Alignment.topRight,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: GreenButton(text: 'Submit', onPressed: (){
                              controller.submit();
                            }),
                          )),
                      SizedBox(height: 10,),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
  ],
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


}




import 'dart:io';
import 'package:fleetmasta/components/custom_txtbox.dart';
import 'package:fleetmasta/components/logout_popup.dart';
import 'package:fleetmasta/components/notification_popup.dart';
import 'package:fleetmasta/components/profile_popup.dart';
import 'package:fleetmasta/components/slider.dart';
import 'package:fleetmasta/const/colors.dart';
import 'package:fleetmasta/const/custom_button.dart';
import 'package:fleetmasta/const/custom_text.dart';
import 'package:fleetmasta/const/form_validation.dart';
import 'package:fleetmasta/controllers/image_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../components/custom_dropdown.dart';
import '../controllers/date_picker_controller.dart';

class ProfileScreen1 extends StatelessWidget {
  DatePickerController controller = Get.put(DatePickerController());
  SliderController  sliderController = Get.put(SliderController());
  final ImagePickerController imagePickerController = Get.put(ImagePickerController());
 ProfileScreen1({Key? key}) : super(key: key);
  final GlobalKey<FormState> globalKey = GlobalKey();


@override
Widget build(BuildContext context) {
  final height = MediaQuery.of(context).size.height;
  return Scaffold(
    body:SingleChildScrollView(
    child:
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
                      mainAxisAlignment: MainAxisAlignment.end,
                       children: [
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

                       ],
                     ),
                   // SizedBox(height: height * 0.02), // 2% of screen height
                    CustomSlider(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Align(
                        alignment: Alignment.topLeft,
                          child: whiteText('Step 1/10')),
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
                      key: globalKey,
                      child: Column(
                        children: [
                          SizedBox(height: 20,),
                          headingContainer('Personal Information', 180, 40),
                          SizedBox(height: 20,),
                          Obx(() {
                            return
                            Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                              IconButton(onPressed: (){
                                imagePickerController.pickImage();
                              },   icon: const Icon(Icons.camera_alt_sharp, size: 25,),),
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: ClipOval(
                                  child: imagePickerController.selectedImagePath.value.isEmpty
                                      ? Image.asset(
                                    'assets/images/user-thumb.png',
                                    height: MediaQuery.of(context).size.height * 0.15,
                                    fit: BoxFit.cover,
                                  )
                                      : Image.file(
                                    File(imagePickerController.selectedImagePath.value),
                                    height: MediaQuery.of(context).size.height * 0.15,
                                    width: MediaQuery.of(context).size.height * 0.15,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],);
                              // GestureDetector(
                              // onTap: () {
                              //   imagePickerController.pickImage();
                              // },

                          }),
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
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'First Name',
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
                                        hintText: 'Enter your first name'),
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
                                              text: 'Last Name',
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
                                          return HelperFunction.checkLastName(str);
                                        },
                                        obscureText:  false,
                                        hintText: 'Enter your  last name'),
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
                                              text: 'Date of birth',
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
                                      onValidate: (str){
                                        return HelperFunction.checkDob(str);
                                      },
                                      controller: controller.dateOfBirth,
                                      onPressed:() => controller.selectDateOfBirth(context),
                                      hintText: 'mm/dd/yy',
                                        suffixIcon: IconButton(
                                        icon:SvgPicture.asset('assets/icons/calender.svg'), color: Appcolor.grey, onPressed: () {  },
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
                                              text: 'Nationality',
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
                                        text: 'Select nationality',
                                        items: [
                                          "Afghanistan",
                                          "Albania",
                                          "Algeria",
                                          "Andorra",
                                          "Angola",
                                          "Antigua and Barbuda",
                                          "Argentina",
                                          "Armenia",
                                          "Australia",
                                          "Austria",
                                          "Azerbaijan",
                                          "Bahamas",
                                          "Bahrain",
                                          "Bangladesh",
                                          "Barbados",
                                          "Belarus",
                                          "Belgium",
                                          "Belize",
                                          "Benin",
                                          "Bhutan",
                                          "Bolivia",
                                          "Bosnia and Herzegovina",
                                          "Botswana",
                                          "Brazil",
                                          "Brunei",
                                          "Bulgaria",
                                          "Burkina Faso",
                                          "Burundi",
                                          "Cabo Verde",
                                          "Cambodia",
                                          "Cameroon",
                                          "Canada",
                                          "Central African Republic",
                                          'Chad',
                                          "Chile",
                                          "China",
                                          "Colombia",
                                          "Comoros",
                                          "Congo, Democratic Republic of the",
                                          "Congo, Republic of the",
                                          "Costa Rica",
                                          "Croatia",
                                          "Cuba",
                                          "Cyprus",
                                          "Czech Republic",
                                          "Denmark",
                                          "Djibouti",
                                          "Dominica",
                                          "Dominican Republic",
                                          "East Timor (Timor-Leste)",
                                          "Ecuador",
                                          "Egypt",
                                          "El Salvador",
                                          "Equatorial Guinea",
                                          "Eritrea",
                                          "Estonia",
                                          "Eswatini",
                                          "Ethiopia",
                                          "Fiji",
                                          "Finland",
                                          "France",
                                          "Gabon",
                                          "Gambia",
                                          "Georgia",
                                          "Germany",
                                          "Ghana",
                                          "Greece",
                                          "Grenada",
                                          "Guatemala",
                                          "Guinea",
                                          "Guinea-Bissau",
                                          "Guyana",
                                          "Haiti",
                                          "Honduras",
                                          "Hungary",
                                          "Iceland",
                                          "India",
                                          "Indonesia",
                                          "Iran",
                                          "Iraq",
                                          "Ireland",
                                          "Israel",
                                          "Italy",
                                          "Jamaica",
                                          "Japan",
                                          "Jordan",
                                          "Kazakhstan",
                                          "Kenya",
                                          "Kiribati",
                                          "Korea, North",
                                          "Korea, South",
                                          "Kosovo",
                                          "Kuwait",
                                          "Kyrgyzstan",
                                          "Laos",
                                          "Latvia",
                                          "Lebanon",
                                          "Lesotho",
                                          "Liberia",
                                          "Libya",
                                          "Liechtenstein",
                                          "Lithuania",
                                          "Luxembourg",
                                          "Madagascar",
                                          "Malawi",
                                          "Malaysia",
                                          "Maldives",
                                          "Mali",
                                          "Malta",
                                          "Marshall Islands",
                                          "Mauritania",
                                          "Mauritius",
                                          "Mexico",
                                          "Micronesia",
                                          "Moldova",
                                          "Monaco",
                                          "Mongolia",
                                          "Montenegro",
                                          "Morocco",
                                          "Mozambique",
                                          "Myanmar (Burma)",
                                          "Namibia",
                                          "Nauru",
                                          "Nepal",
                                          "Netherlands",
                                          "New Zealand",
                                          'Nicaragua',
                                          "Niger",
                                          "Nigeria",
                                          "North Macedonia (Macedonia)",
                                          "Norway",
                                          "Oman",
                                          "Pakistan",
                                          "Palau",
                                          "Panama",
                                          "Papua New Guinea",
                                          "Paraguay",
                                          "Peru",
                                          "Philippines",
                                          "Poland",
                                          "Portugal",
                                          "Qatar",
                                          "Romania",
                                          "Russia",
                                          "Rwanda",
                                          "Saint Kitts and Nevis",
                                          "Saint Lucia",
                                          "Saint Vincent and the Grenadines",
                                          "Samoa",
                                          "San Marino",
                                          "Sao Tome and Principe",
                                          "Saudi Arabia",
                                          "Senegal",
                                          "Serbia",
                                          "Seychelles",
                                          "Sierra Leone",
                                          "Singapore",
                                          "Slovakia",
                                          "Slovenia",
                                          "Solomon Islands",
                                          "Somalia",
                                          "South Africa",
                                          "South Sudan",
                                          'Spain',
                                          "Sri Lanka",
                                          "Sudan",
                                          "Suriname",
                                          "Sweden",
                                          "Switzerland",
                                          "Syria",
                                          "Taiwan",
                                          "Tajikistan",
                                          "Tanzania",
                                          "Thailand",
                                          "Togo",
                                          "Tonga",
                                          "Trinidad and Tobago",
                                          'Tunisia',
                                          "Turkey",
                                          "Turkmenistan",
                                          "Tuvalu",
                                          "Uganda",
                                          "United Arab Emirates",
                                          "United Kingdom",
                                          "United States",
                                          "Uruguay",
                                          "Uzbekistan",
                                          "Vanuatu",
                                          "Vatican City (Holy See)",
                                          "Venezuela",
                                          "Vietnam",
                                          "Yemen",
                                          "Zambia",
                                          "Zimbabwe"
                                        ],

                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(15),
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
                                                text: 'Martial Status',
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
                                      CustomDropdown(
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return '';
                                          }
                                          return null;
                                        },
                                        text: 'Select martial status',
                                        items: ['Single', 'Maried', 'Widowed','Divorced', ],),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                                                    ),
                          ),
                          SizedBox(height: 25,),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10,  horizontal: 10),
                            child: CustomButton(text: 'Next', onPressed: () {
                            if (globalKey.currentState!.validate()&& imagePickerController.isImageSelected()) {
                              sliderController.updateSliderValue(
                                  sliderController.currentSliderValue.value +
                                      1);
                              Get.toNamed('/profileScreen2');
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
  );
}
}















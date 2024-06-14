import 'package:fleetmasta/screens/dashboard_screen.dart';
import 'package:fleetmasta/screens/login_screen.dart';
import 'package:fleetmasta/screens/profile_screen1.dart';
import 'package:fleetmasta/screens/profile_screen2.dart';
import 'package:fleetmasta/screens/profile_screen3.dart';
import 'package:fleetmasta/screens/profile_screen_about_job.dart';
import 'package:fleetmasta/screens/profile_screen_bg_check.dart';
import 'package:fleetmasta/screens/profile_screen_medical_history.dart';
import 'package:fleetmasta/screens/profile_screen_payment_info.dart';
import 'package:fleetmasta/screens/profile_screen_reference_check.dart';
import 'package:fleetmasta/screens/profile_upload_evidence.dart';
import 'package:fleetmasta/screens/reset_password.dart';
import 'package:fleetmasta/screens/view_profile_screen1.dart';
import 'package:fleetmasta/screens/welcome_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../screens/forgot_password.dart';
import '../screens/profile_confrimation_screen.dart';
import '../screens/profile_screen_emergency_contact.dart';

class AppRouting {
  static List<GetPage<dynamic>> routes  =[
    GetPage(name: "/welcomeScreen", page:()=>WelcomeScreen(),),
    GetPage(name: "/loginScreen", page:()=>LoginScreen(),),
    GetPage(name: "/forgotPassScreen", page:()=>ForgotPassScreen(),),
    GetPage(name: "/resetPassScreen", page:()=>ResetPassScreen(),),
    GetPage(name: "/profileScreen1", page:()=>ProfileScreen1(),),
    GetPage(name: "/profileScreen2", page:()=>ProfileScreen2(),),
    GetPage(name: "/profileScreen3", page:()=>ProfileScreen3(),),
    GetPage(name: "/profileScreenAboutJob", page:()=>ProfileScreenAboutJob(),),
    GetPage(name: "/profileScreenMedicalHistory", page:()=>ProfileScreenMedicalHistory(),),
    GetPage(name: "/ProfileScreenBgCheck", page:()=>ProfileScreenBgCheck(),),
    GetPage(name: "/ProfileScreenPaymentInfo", page:()=>ProfileScreenPaymentInfo(),),
    GetPage(name: "/ProfileScreenEmgContact", page:()=>ProfileScreenEmergencyContact(),),
    GetPage(name: "/ProfileScreenRefCheck", page:()=>ProfileScreenReferenceCheck(),),
    GetPage(name: "/profileUploadDoc", page:()=>ProfileUploadDocumentsScreen(),),
    GetPage(name: "/profileConfirmationScreen", page:()=>profileConfirmationScreen(),),
    GetPage(name: "/viewProfileScreen", page:()=>ViewProfileScreen1(),),
    GetPage(name: "/dashboardScreen", page:()=>DashboardScreen(),),


  ];
}
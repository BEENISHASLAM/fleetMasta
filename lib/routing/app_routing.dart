import 'package:fleetmasta/screens/login_screen.dart';
import 'package:fleetmasta/screens/reset_password.dart';
import 'package:fleetmasta/screens/welcome_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../screens/forgot_password.dart';

class AppRouting {
  static List<GetPage<dynamic>> routes  =[
    GetPage(name: "/welcomeScreen", page:()=>WelcomeScreen(),),
    GetPage(name: "/loginScreen", page:()=>LoginScreen(),),
    GetPage(name: "/forgotPassScreen", page:()=>ForgotPassScreen(),),
    GetPage(name: "/resetPassScreen", page:()=>ResetPassScreen(),),


  ];
}
import 'package:fleetmasta/components/checkbox.dart';
import 'package:fleetmasta/const/colors.dart';
import 'package:fleetmasta/const/custom_button.dart';
import 'package:fleetmasta/const/custom_text.dart';
import 'package:fleetmasta/controllers/check_box_controller.dart';
import 'package:fleetmasta/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/custom_txtbox.dart';
import '../const/form_validation.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final LoginController loginController = Get.put(LoginController());
  final CheckboxController checkboxController = Get.put(CheckboxController());

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    double horizontalPadding = width * 0.03; // 3% of screen width
    double verticalPadding = height * 0.01; // 1% of screen height

    return SafeArea(
      child: Scaffold(
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
                  padding: EdgeInsets.all(horizontalPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: height * 0.05), // 5% of screen height
                      Image.asset('assets/images/FM-White.png'),
                      SizedBox(height: height * 0.03), // 3% of screen height
                      heading('Sign in'),
                      SizedBox(height: height * 0.01), // 1% of screen height
                      noraml('Enter your email and password to sign in'),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.02), // 2% of screen height
                Container(
                  decoration: BoxDecoration(
                    color: Appcolor.bg,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                    child: Form(
                      key: loginController.formGlobalKey,
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          Padding(
                            padding: EdgeInsets.all(verticalPadding),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(verticalPadding),
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
                                CustomTextBox(
                                  keyboardType: TextInputType.emailAddress,
                                  onValidate: (str) {
                                    return HelperFunction.checkEmail(str);
                                  },
                                  controller:loginController.emailController,
                                  hintText: 'Enter your email address',
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(verticalPadding),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(verticalPadding),
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Password',
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
                                CustomTextBox(
                                  obscureText: true,
                                  onValidate: (str) {
                                    return HelperFunction.checkPassword(str);
                                  },
                                  controller:loginController.passwordController,
                                  hintText: '*******',
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                            child:
                           RememberMeForgotPassword(
                              rememberMeText: 'Remember me ', forgotPasswordText: 'Forgot password',),
                            ),
                          SizedBox(height: 25),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: verticalPadding, horizontal: 10),
                            child: CustomButton(
                              text: 'Sign in',
                              onPressed: () {
                                loginController.login();
                                // if (formGlobalKey.currentState!.validate()) {
                                //   Get.toNamed('/resetPassScreen');
                                // }
                              },
                            ),
                          ),
                        ],
                      ),
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

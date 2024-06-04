import 'package:fleetmasta/components/checkbox.dart';
import 'package:fleetmasta/const/colors.dart';
import 'package:fleetmasta/const/custom_button.dart';
import 'package:fleetmasta/const/custom_text.dart';
import 'package:fleetmasta/const/form_validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/custom_txtbox.dart';

class ForgotPassScreen extends StatelessWidget {
  ForgotPassScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    double horizontalPadding = width * 0.03; // 3% of screen width
    double verticalPadding = height * 0.01;
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
                      SizedBox(height: height * 0.02), // 2% of screen height
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Image.asset('assets/images/back_arrow.png'),
                        ),
                      ),
                      SizedBox(height: height * 0.09), // 9% of screen height
                      Image.asset('assets/images/FM-White.png'),
                      heading('Forgot password'),
                      SizedBox(height: height * 0.01), // 1% of screen height
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: noraml('Enter your email address to get password reset link'),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.03), // 3% of screen height
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
                      key: globalKey,
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          Padding(
                            padding: EdgeInsets.all(verticalPadding),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: verticalPadding),
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
                                  onValidate: (str) {
                                    return HelperFunction.checkFirstName(str);
                                  },
                                  hintText: 'Enter your email address',
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 25),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: verticalPadding, horizontal: 10),
                            child: CustomButton(
                              text: 'Send',
                              onPressed: () {
                                if (globalKey.currentState!.validate()) {
                                  Get.toNamed('/resetPassScreen');
                                }
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

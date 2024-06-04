import 'package:fleetmasta/const/colors.dart';
import 'package:fleetmasta/const/custom_button.dart';
import 'package:fleetmasta/const/custom_text.dart';
import 'package:fleetmasta/const/form_validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/custom_txtbox.dart';

class ResetPassScreen extends StatelessWidget {
  ResetPassScreen({Key? key}) : super(key: key);
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
                      SizedBox(height: height * 0.05), // 5% of screen height
                      Image.asset('assets/images/FM-White.png'),
                      SizedBox(height: height * 0.03),
                      heading('Change password'),
                      SizedBox(height: height * 0.01), // 1% of screen height
                      noraml('Enter your new password'),
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
                                          text: 'New password',
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
                                  obscureText: true,
                                  hintText: '*****',
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: verticalPadding),
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Confirm password',
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
                                  obscureText: true,
                                  hintText: '*****',
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 25),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: verticalPadding, horizontal: 10),
                            child: CustomButton(
                              text: 'Reset',
                              onPressed: () {
                                if (globalKey.currentState!.validate()) {
                                  Get.toNamed('/profileScreen1');
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

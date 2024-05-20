import 'package:fleetmasta/const/colors.dart';
import 'package:fleetmasta/const/custom_button.dart';
import 'package:fleetmasta/const/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/custom_searchbar.dart';

class ResetPassScreen extends StatelessWidget {
  const ResetPassScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          double screenWidth = constraints.maxWidth;
          double screenHeight = constraints.maxHeight;
          double horizontalPadding = screenWidth * 0.03; // 5% of screen width
          double verticalPadding = screenHeight * 0.01; // 2% of screen height

          return Container(
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
                      SizedBox(height: screenHeight * 0.05), // 5% of screen height
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Image.asset('assets/images/back_arrow.png'),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.05), // 2% of screen height
                      Image.asset('assets/images/FM-White.png'),
                      SizedBox(height: screenHeight * 0.03),
                      heading('Reset password'),
                      SizedBox(height: screenHeight * 0.01), // 1% of screen height
                      noraml('Enter your new password'),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.03), // 3% of screen height
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Appcolor.bg,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                        child: Column(
                          children: [
                            SizedBox(height: 20,),
                            Padding(
                              padding: EdgeInsets.all(verticalPadding),
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(verticalPadding),
                                      child: RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'New password',
                                              style: TextStyle(
                                                color: Appcolor.lightBlack,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),

                                          ],
                                        ),
                                      ),
                                    ),
                                    CustomSearchBar(
                                      obscureText: true,
                                        hintText: '*****'),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(verticalPadding),
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: 'Confirm password',
                                            style: TextStyle(
                                              color: Appcolor.lightBlack,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    CustomSearchBar(
                                        obscureText: true,
                                        hintText: '*******'),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 25,),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: verticalPadding,  horizontal: 10),
                              child: CustomButton(text: 'Reset', onPressed: () {

                              }),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),

    );
  }
}

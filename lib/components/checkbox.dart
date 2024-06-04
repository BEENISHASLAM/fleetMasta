import 'package:fleetmasta/const/colors.dart';
import 'package:fleetmasta/const/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RememberMeForgotPassword extends StatefulWidget {
  @override
  _RememberMeForgotPasswordState createState() => _RememberMeForgotPasswordState();
}

class _RememberMeForgotPasswordState extends State<RememberMeForgotPassword> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  _isChecked = !_isChecked;
                });
              },
              child: Container(
                width: 24.0,
                height: 24.0,
                decoration: BoxDecoration(
                  color: _isChecked ? Appcolor.white : Colors.white,
                  border: Border.all(color:Appcolor.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: _isChecked
                    ? Icon(
                  Icons.check,
                  size: 18.0,
                  color:Appcolor.purple,
                  weight:20,
                )
                    : null,
              ),
            ),
            SizedBox(width:5.0),
            grayText(
              'Remember Me',
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
            Get.toNamed('/forgotPassScreen');
          },
          child: Text(
            'Forgot Password',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color:Appcolor.purple
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:fleetmasta/const/colors.dart';
import 'package:flutter/material.dart';

class CustomTextBox extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final  Widget? suffixIcon;
  final  controller;
  final onPressed;
  final onValidate;

  CustomTextBox({
    required this.hintText,
    this.obscureText = false,
    this.suffixIcon,
    this.controller,
    this.onPressed,
    this.onValidate
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Center(
        child: TextFormField(
          validator: onValidate,
          onTap: onPressed,
          controller: controller,
          obscureText:obscureText,
          style: TextStyle(
            color: Appcolor.grey,
            fontSize: 14
            // Change the color here
          ),
          decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: suffixIcon,
            filled: true,
            hintStyle: TextStyle(color: Appcolor.grey),
            fillColor: Appcolor.white,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(12.0),
             // borderSide: BorderSide(color: Appcolor.white, width: 1.0),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(color: Colors.red),
            ),
          ),
        ),
      ),
    );
  }
}


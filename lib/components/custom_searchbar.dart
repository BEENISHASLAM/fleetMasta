import 'package:fleetmasta/const/colors.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final String hintText;
  final bool obscureText;

  CustomSearchBar({
    required this.hintText,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        height: 58,
        decoration: BoxDecoration(
          color: Appcolor.white,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color:Appcolor.grey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Center(
          child: TextFormField(
            obscureText:obscureText,
            style: TextStyle(
              color: Appcolor.grey,
              fontSize: 15
              // Change the color here
            ),
            decoration: InputDecoration(
              hintText: hintText,
              filled: true,
              hintStyle: TextStyle(color: Appcolor.grey),
              fillColor: Appcolor.white,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(50.0),
               // borderSide: BorderSide(color: Appcolor.white, width: 1.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


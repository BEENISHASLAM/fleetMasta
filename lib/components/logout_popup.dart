import 'package:fleetmasta/const/colors.dart';
import 'package:fleetmasta/const/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class LogoutPopup extends StatelessWidget {
  final VoidCallback onConfirmLogout;
  final VoidCallback onCancel;

  LogoutPopup({required this.onConfirmLogout, required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon:SvgPicture.asset('assets/icons/info_1.svg'),
      title:grayText('Are you sure you want to log-off?'),
      content:grayTex1('You may lose unsaved entries. Press Okay to continue else cancel log-off'),
      actions: [
    ElevatedButton(
    style: ElevatedButton.styleFrom(
    primary: Appcolor.grey, // Background color
      onPrimary: Colors.white, // Text color
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ), onPressed:onCancel, child:Text("Cancel"),),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Appcolor.green, // Background color
            onPrimary: Colors.white, // Text color
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ), onPressed:onConfirmLogout, child:Text("Ok"),),

      ],
    );
  }
}

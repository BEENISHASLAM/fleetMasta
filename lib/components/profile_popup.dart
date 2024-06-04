import 'package:fleetmasta/const/colors.dart';
import 'package:fleetmasta/const/custom_text.dart';
import 'package:flutter/material.dart';

class ProfilePopup extends StatelessWidget {
  final VoidCallback onProfileTap;
  final VoidCallback onLogoutTap;

  const ProfilePopup({
    Key? key,
    required this.onProfileTap,
    required this.onLogoutTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.person, color:Appcolor.lightBlack), // Assuming Appcolor.grey is Colors.grey for simplicity
              title: grayText('View Profile',), // Assuming grayText is a method that returns Text with grey color
              onTap: onProfileTap,
            ),
            ListTile(
              leading: Icon(Icons.logout, color:Appcolor.lightBlack),
              title: grayText('Logout',),
              onTap: onLogoutTap,
            ),
          ],
        ),
      ),
    );
  }
}

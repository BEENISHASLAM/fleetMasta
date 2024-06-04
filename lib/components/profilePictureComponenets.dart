import 'package:flutter/material.dart';

class profilePictureComponent extends StatelessWidget {
  const profilePictureComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: EdgeInsets.only(right: 10, top: 10),
      child: CircleAvatar(
      radius: 20, // Adjust the radius as needed
      backgroundImage:AssetImage('assets/images/profilePicture.png'), // Replace with your image URL
    )  );
  }
}

import 'package:fleetmasta/const/colors.dart';
import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;
  final double borderRadius;
  final double padding;
  final bool? isDisabled;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color = const Color.fromRGBO(196, 39, 144, 1),
    this.textColor = Colors.white,
    this.borderRadius = 100.0,
    this.padding = 10.0,
    this.isDisabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: textColor, backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          padding: EdgeInsets.all(padding),
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}




class CustomOutlinedButton extends StatelessWidget {
  final imagePath;
  final String text;
  final VoidCallback onPressed;
  final double padding;

  const CustomOutlinedButton({
    Key? key,
    required this.imagePath,
    required this.text,
    required this.onPressed,
    this.padding = 16.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        side:MaterialStateProperty.all(
            BorderSide(color: Appcolor.purple)
        ),
      ),

      child: Padding(
        padding: EdgeInsets.all(padding),
        child: Row(
          children: [
            Image.asset(
              imagePath,
              width: 24,
              height: 24, // Optionally apply color to the image
            ),
            SizedBox(width: 20,),
            Text(
              text,
              style:
              TextStyle(color:Appcolor.lightGrey,
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}










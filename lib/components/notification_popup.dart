import 'package:fleetmasta/const/colors.dart';
import 'package:fleetmasta/const/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class NotificationPopup extends StatelessWidget {
  final VoidCallback onAllNotificationTap;

  const NotificationPopup({
    Key? key,
    required this.onAllNotificationTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: grayText('All notification'),
              ),
              SizedBox(width: 10),
              grayTex1('10 mins ago'),
              IconButton(
                icon: SvgPicture.asset('assets/icons/cut.svg'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
          grayTex1(
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry'
                'Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, ',
          ),
          SizedBox(height: 10),
          grayTex1(
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry'
                'Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, ',
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Get.toNamed("/notificationScreen");
          },
          child: Text('See all notification'),
        ),
      ],
    );

  }
}














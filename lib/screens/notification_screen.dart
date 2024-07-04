
import 'package:fleetmasta/components/logout_popup.dart';
import 'package:fleetmasta/components/notification_popup.dart';
import 'package:fleetmasta/components/profile_popup.dart';
import 'package:fleetmasta/components/slider.dart';
import 'package:fleetmasta/const/colors.dart';
import 'package:fleetmasta/const/custom_text.dart';
import 'package:fleetmasta/const/widgets.dart';
import 'package:fleetmasta/controllers/image_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../controllers/date_picker_controller.dart';

class NotificationScreen extends StatelessWidget {
DatePickerController controller = Get.put(DatePickerController());
SliderController  sliderController = Get.put(SliderController());
final ImagePickerController imagePickerController = Get.put(ImagePickerController());
NotificationScreen({Key? key}) : super(key: key);
final GlobalKey<FormState> globalKey = GlobalKey();


@override
Widget build(BuildContext context) {
final height = MediaQuery.of(context).size.height;
return Scaffold(
body:SingleChildScrollView(
child:
Container(
width: double.infinity,
decoration: BoxDecoration(
color: Appcolor.purple,
),
child: Column(
children: [
Padding(
padding: EdgeInsets.all(10),
child: Column(
children: [
SizedBox(height: 50,),
Row(
  mainAxisAlignment: MainAxisAlignment.end,
  children: [
    IconButton(
      icon: SvgPicture.asset('assets/icons/alert.svg'),
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return NotificationPopup(onAllNotificationTap: () {  },);
          },
        );
      },
    ),
    IconButton(
      icon: Icon(Icons.account_circle,color: Colors.white),
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return ProfilePopup(
              onProfileTap: () {
                Get.toNamed('/viewProfileScreen');
              },
              onLogoutTap: () {
                Navigator.of(context).pop(); // Close ProfilePopup
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return LogoutPopup(
                      onConfirmLogout: () {
                        Get.toNamed('/loginScreen'); // Close LogoutPopup
                      },
                      onCancel: () {
                        Navigator.of(context).pop(); // Close LogoutPopup
                      },
                    );
                  },
                );
              },
            );
          },
        );
      },
    ),

  ],
),
SizedBox(height: 20,),
],
),
),
//SizedBox(height: height * 0.03), // 3% of screen height
SizedBox(
child: Container(
decoration: BoxDecoration(
color: Appcolor.bg,
borderRadius: BorderRadius.only(
  topLeft: Radius.circular(40),
  topRight: Radius.circular(40),
),
),
child: Padding(
padding: EdgeInsets.symmetric(horizontal: 10),
child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    SizedBox(height: 20,),
    Row(
      children: [
      IconButton(
        icon: SvgPicture.asset('assets/icons/backIcon.svg'),
        onPressed: () {
          Get.back();
        },
      ),
    SizedBox(width: 90,),
    lightBack( "Notifications"),
    ],),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        grayText("All"),
          purpleText("Marks all as read"),
      ],),
    ),
    ListView.builder(
      shrinkWrap: true, // This makes the ListView only occupy the necessary space
      physics: NeverScrollableScrollPhysics(), // Disables scrolling to prevent conflicts with parent scroll
      itemCount: 5,
      itemBuilder: (context, index) {
        return productTile(text: "productTileproductTileproductTile");
      },
    )

  ],
),
),
),
),
],
),
)),
);
}
}















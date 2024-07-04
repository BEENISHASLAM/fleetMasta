import 'package:fleetmasta/const/colors.dart';
import 'package:fleetmasta/const/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatelessWidget {
  final Function() onHomeTap;
  final Function() onDashboardTap;
  final Function() onSettingsTap;
  final Function() onContactTap;

  const CustomDrawer({
    Key? key,
    required this.onHomeTap,
    required this.onDashboardTap,
    required this.onSettingsTap,
    required this.onContactTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Appcolor.purple,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(
            height: 150,),
          ListTile(
            leading: Image.asset('assets/images/Frame (1).png'),
            onTap: () {
              Navigator.pop(context);
              // Handle the Contact action here
            },
          ),
          ListTile(
            leading: Image.asset('assets/images/Vector (7).png'),
            title: whiteText('Dashboard'),
            onTap: onDashboardTap,
          ),
          ListTile(
            leading: Image.asset('assets/images/Vector (6).png'),
            title: whiteText('All shifts'),
            onTap: onSettingsTap
          ),
          ListTile(
            leading: Image.asset('assets/images/Vector (5).png'),
            title: whiteText('Time sheet'),
            onTap: onContactTap,
          ),
          ListTile(
            leading:Image.asset('assets/images/Vector (4).png'),
            title: whiteText('Vehicle maintenance '),
            onTap: () {
              Navigator.pop(context);
              // Handle the Contact action here
            },
          ),
          ListTile(
            leading: Image.asset('assets/images/Vector (3).png'),
            title: whiteText('Vehicle defects'),
            onTap: () {
              Navigator.pop(context);
              // Handle the Contact action here
            },
          ),
          ListTile(
            leading: Image.asset('assets/images/report.png'),
            title: whiteText('Damage reports'),
            onTap: () {
              Navigator.pop(context);
              // Handle the Contact action here
            },
          ),
          ListTile(
            leading: Image.asset('assets/images/report.png'),
            title: whiteText('Incident Reporting'),
            onTap: () {
              Navigator.pop(context);
              // Handle the Contact action here
            },
          ),
          ListTile(
            leading: Image.asset('assets/images/report.png'),
            title: whiteText('Walkaround Checks'),
            onTap: () {
              Navigator.pop(context);
              // Handle the Contact action here
            },
          ),
          ListTile(
            leading: Image.asset('assets/images/report.png'),
            title: whiteText('Trailer Checks'),
            onTap: () {
              Navigator.pop(context);
              // Handle the Contact action here
            },
          ),
          ListTile(
            leading: Image.asset('assets/images/report.png'),
            title: whiteText('Timesheet reports'),
            onTap: () {
              Navigator.pop(context);
              // Handle the Contact action here
            },
          ),
          ListTile(
            leading:Image.asset('assets/images/report.png'),
            title: whiteText('Holidays'),
            onTap: () {
              Navigator.pop(context);
              // Handle the Contact action here
            },
          ),
          ListTile(
            leading: Image.asset('assets/images/report.png'),
            title: whiteText('Expenses'),
            onTap: () {
              Navigator.pop(context);
              // Handle the Contact action here
            },
          ), ListTile(
            leading: Image.asset('assets/images/report.png'),
            title: whiteText(' All Expenses'),
            onTap: () {
             Get.toNamed('allExpensesScreen');
              // Handle the Contact action here
            },
          ),
          ListTile(
            leading: Image.asset('assets/images/report.png'),
            title: whiteText('Invoices'),
            onTap: () {
              Get.toNamed('allInvoicesScreen');
              // Handle the Contact action here
            },
          ),
        ],
      ),
    );
  }
}

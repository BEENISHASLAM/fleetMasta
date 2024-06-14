import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/app_menu.dart';
import '../components/profile_popup.dart';
import '../const/colors.dart';
import '../const/custom_text.dart';
import '../components/profile_view_table.dart';
import '../controllers/profile_view_controller.dart';

class DashboardScreen extends StatelessWidget {
  final ProfileViewController controller = Get.put(ProfileViewController());

  DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    final mediaQuery = MediaQuery.of(context);
    final height = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: CustomDrawer(
          onHomeTap: () {},
          onDashboardTap: () {},
          onContactTap: () {},
          onSettingsTap: () {},
        ),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Appcolor.purple,
            ),
            child: Column(
             // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(screenWidth * 0.025),
                  child: Column(
                   // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: height * 0.05),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.menu, color: Colors.white, size: 30),
                            onPressed: () {
                              _scaffoldKey.currentState?.openDrawer();
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.account_circle, color: Colors.white),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return ProfilePopup(
                                    onProfileTap: () {
                                      Navigator.of(context).pop();
                                    },
                                    onLogoutTap: () {
                                      Navigator.of(context).pop();
                                    },
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: height * 0.02),
                      Row(
                        children: [
                          SizedBox(width: 17,),
                              Image.asset('assets/images/dashboard.png'),
                              SizedBox(width: 10,),
                              noraml("/Dashboard")
                            ],
                      ),
                      SizedBox(height: height * 0.02),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Appcolor.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.025),
                    child: Column(
                      children: [
                        SizedBox(height: height * 0.05),
                        lightBack("Shift Details"),
                        SizedBox(height: height * 0.02),
                        EmployeeDetailsCard(details: [
                          {'label': ' Name', 'value': 'Test'},
                          {'label': 'Location', 'value': 'xyz'},
                        ],),
                        Container(
                          decoration: BoxDecoration(
                            color:Appcolor.bbg1,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width:200,
                                height: 40,
                                decoration: BoxDecoration(
                                  color:Appcolor.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child:
                                Center(child: grayText("09 May 2024")),
                                ),
                            ),
                          Padding(
                            padding:EdgeInsets.symmetric(horizontal: 20),
                             child: buildCard('Working', 'NJ22AKY -> 10:00 PM',(){
                              showDialog(
                              context: context,
                              builder: (BuildContext context) {
                              return AlertDialog(
                              title: Text('Popup Title'),
                              content: Text('This is the content of the popup.'),
                              actions: <Widget>[
                              TextButton(
                              onPressed: () {
                              Navigator.of(context).pop();
                              },
                              child: Text('Close'),
                              ),
                              ],
                              );
                              },
                              );
                            }, (){}, (){}),
                          ),
                          SizedBox(height: 15,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: buildCard('Overtime', 'NJ22AKY -> 10:00 PM',(){}, (){}, (){}),
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              buildIconButton(Icons.play_circle_fill, () {
                                // Handle back button press
                              }),
                              SizedBox(width: 20),
                              buildIconButton(Icons.play_circle_fill, () {
                                // Handle play button press
                              }),
                            ],
                          ), ],),
                        ),
                        SizedBox(height: height * 0.02),
                        lightBack("Dashboard"),
                        SizedBox(height: height * 0.02),
                        Container(
                          width: double.infinity,
                            decoration: BoxDecoration(
                              color:Appcolor.bbg1,
                              borderRadius: BorderRadius.circular(12),
                          ),child:Column(children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 250,
                                  decoration: BoxDecoration(
                                    color:Appcolor.white,
                                    borderRadius: BorderRadius.circular(12),
                                  ) ,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                        grayTex1("Total holidays in currrent year"),
                                        Image.asset('assets/images/🦆 icon _person_.png'),
                                      ],),
                                      grayTex1("0"),

                                    ],
                                  ),
                                ),
                              ),
                            ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 250,
                              decoration: BoxDecoration(
                                color:Appcolor.white,
                                borderRadius: BorderRadius.circular(12),
                              ) ,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        grayTex1("Total holidays in currrent year"),
                                        Image.asset('assets/images/truck.png'),
                                      ],),
                                    grayTex1("0"),

                                  ],
                                ),
                              ),
                            ),
                          ),

                        ],)
                          ),
                        SizedBox(height: height * 0.02),


                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget buildCard(
      String status, String time,
      VoidCallback onEditTap,
      VoidCallback onVCheckTap,
      VoidCallback onSignInTap,
      ) {
    return Container(
      decoration: BoxDecoration(
        color: Appcolor.white,
        borderRadius: BorderRadius.circular(10),
        border: Border(
          left: BorderSide(
            color:status == 'Working' ?Appcolor.green : Colors.lightGreen, // Customize the border color here
            width: 5.0, // Customize the border width here
          ),
        ),

      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(height: 10),
            Container(
              width: 200,
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                color: status == 'Working' ?Appcolor.green : Colors.lightGreen,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                status,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              time,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed:onEditTap,
                  style: ElevatedButton.styleFrom(
                    primary:Appcolor.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text('Edit', style: TextStyle(color: Appcolor.white),),
                ),
                OutlinedButton(
                  onPressed:onVCheckTap,
                  style: OutlinedButton.styleFrom(
                    primary: Appcolor.purple,
                    side: BorderSide(color:Appcolor.purple),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text('V-check'),
                ),
                OutlinedButton(
                  onPressed:onSignInTap,
                  style: OutlinedButton.styleFrom(
                    primary: Appcolor.purple,
                    side: BorderSide(color:Appcolor.purple),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text('Sign-in'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildIconButton(IconData icon, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, size: 30, color: Appcolor.purple),
      ),
    );
  }
}


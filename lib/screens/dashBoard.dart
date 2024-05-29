import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/checkbox.dart';
import '../components/custom_dropdown.dart';
import '../components/custom_searchbar.dart';
import '../components/profilePictureComponenets.dart';
import '../components/sliderForDashBoard.dart';
import '../const/colors.dart';
import '../const/custom_button.dart';
import '../const/custom_text.dart';


class dashBoardScreen extends StatefulWidget {
  const dashBoardScreen({super.key});

  @override
  State<dashBoardScreen> createState() => _dashBoardScreenState();
}

class _dashBoardScreenState extends State<dashBoardScreen> {
  List<String> DashBoardCarImageList = ['assets/icons/icon_person.png','assets/icons/dashBoardCarIcon.png'];
  List<String> DashBoardDiscriptionList = ["Total Working Day In Current Year ",  "Total Holiday in Current Year"];
  int i = 1;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          double screenWidth = constraints.maxWidth;
          double screenHeight = constraints.maxHeight;
          double horizontalPadding = screenWidth * 0.03; // 5% of screen width
          double verticalPadding = screenHeight * 0.01; // 2% of screen height

          return Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Appcolor.purple,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(horizontalPadding, 40, horizontalPadding, horizontalPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: screenHeight * 0.05), // 5% of screen height
                      Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: InkWell(
                          onTap: () {
          Navigator.pop(context);
          },
            child: Align(
              alignment: Alignment.topLeft,
              child: Image.asset('assets/images/Frame.png'),
            ),

          ),),
                           Expanded(
                             flex: 3,
                             child:  InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Align(
                                alignment: Alignment.topRight,
                                child: profilePictureComponent()

                              ),

                            ),),

                          ]),
                      SizedBox(height: screenHeight * 0.03),
                       Row(children: [
                    Icon(Icons.dashboard_outlined, color: Appcolor.bg),
                    SizedBox(height: screenHeight * 0.01), // 1% of screen height
                    noraml(' /DashBoard'),
                  ],)

                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.02), // 3% of screen height
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Appcolor.bg,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                        child: Column(
                          children: [
                            SizedBox(height: 20,),
                            Padding(
                              padding: EdgeInsets.all(verticalPadding),
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(verticalPadding),
                                      child: RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'Shift Details',
                                              style: TextStyle(
                                                color: Appcolor.lightBlack,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),

                                          ],
                                        ),
                                      ),
                                    )
                                  ]
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(verticalPadding),
                              child: Container(
                                decoration: BoxDecoration(
                                color: Appcolor.lightgrey,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40),
                                  topRight: Radius.circular(40),
                                  bottomLeft: Radius.circular(40),
                                  bottomRight: Radius.circular(40)
                                ),),
                                height: 300,
                                width: 300,
                                child: Column(
                              //    crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                    padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                                    child: Row(
                                        children: [
                                          Expanded(
                                            flex: 3,
                                            child: InkWell(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: Align(
                                                alignment: Alignment.topLeft,
                                                child: Text("Name")
                                              ),

                                            ),),
                                          Expanded(
                                            flex: 3,
                                            child:  InkWell(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: Align(
                                                  alignment: Alignment.topRight,
                                                  child: Text("abc")

                                              ),

                                            ),),

                                        ])),
                                    Divider(color: Appcolor.bg),
                                    Padding(
                                        padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                                        child: Row(
                                            children: [
                                              Expanded(
                                                flex: 3,
                                                child: InkWell(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Align(
                                                      alignment: Alignment.topLeft,
                                                      child: Text("Location")
                                                  ),

                                                ),),
                                              Expanded(
                                                flex: 3,
                                                child:  InkWell(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Align(
                                                      alignment: Alignment.topRight,
                                                      child: Text("ABC")

                                                  ),

                                                ),),

                                            ])),
                                    Divider(color: Appcolor.bg),
                                    SizedBox(height: 10,),
                                    Center(
                                      child: Container(
                                        height: 30,
                                      width: 200,
                                      color: Appcolor.bg,
                                      child: Center(
                                        child: Text("09 May 2024", style: TextStyle(
                                          fontSize: 20
                                        ),),
                                    ),)),
                                    SizedBox(height: 10,),
                                    Center(
                                        child: i == 0 ? Container(
                                          height: 30,
                                          width: 200,
                                          color: Appcolor.grey,
                                          child: Center(
                                            child: Text("NAN", style: TextStyle(
                                                fontSize: 20
                                            ),),
                                          ),):
                                        Sliderfordashboard()

                                    )
    ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(verticalPadding),
                              child: Container(
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(verticalPadding),
                                        child: RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: 'Dashboard',
                                                style: TextStyle(
                                                  color: Appcolor.lightBlack,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),

                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(verticalPadding),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Appcolor.lightgrey,
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(40),
                                                topRight: Radius.circular(40),
                                                bottomLeft: Radius.circular(40),
                                                bottomRight: Radius.circular(40)
                                            ),),
                                          height: 300,
                                          width: 300,
                                          child: Column(
                                            //    crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(height: 20,),
                                              Center(
                                                  child: Container(
                                                    height: 70,
                                                    width: 200,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.only(
                                                          topLeft: Radius.circular(10),
                                                          topRight: Radius.circular(10),
                                                          bottomLeft: Radius.circular(10),
                                                          bottomRight: Radius.circular(10)
                                                      ),
                                                        color: Appcolor.bg
                                                    ),

                                                    child:

                                                          Row( children:[
                                                            Expanded(
                                                              flex: 3,
                                                              child: Text("Total Working Day In Current Year"+ "\n 0", style: TextStyle(
                                                                fontSize: 16,
                                                              )
                                                              ),
                                                            ),
                                                            Expanded(
                                                                flex: 1,
                                                                child: Padding(
                                                                  padding: EdgeInsets.only(right: 10),
                                                                  child: Image.asset('assets/icons/icon_person.png',
                                                                    fit: BoxFit.contain,
                                                                  ),
                                                                  // Replace with your image URL
                                                                )  )
                                                          ]))

                                                    ),
                                              SizedBox(height: 20,),
                                              Center(
                                                  child: Container(
                                                      height: 70,
                                                      width: 200,
                                                      decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.only(
                                                              topLeft: Radius.circular(10),
                                                              topRight: Radius.circular(10),
                                                              bottomLeft: Radius.circular(10),
                                                              bottomRight: Radius.circular(10)
                                                          ),
                                                          color: Appcolor.bg
                                                      ),

                                                      child:

                                                      Row( children:[
                                                        Expanded(
                                                          flex: 3,
                                                          child: Text("Total Holiday in Current Year "+ "\n 0", style: TextStyle(
                                                            fontSize: 16,
                                                          )
                                                          ),
                                                        ),
                                                        Expanded(
                                                            flex: 1,
                                                            child: Padding(
                                                              padding: EdgeInsets.only(right: 10),
                                                              child: Image.asset('assets/icons/dashBoardCarIcon.png',
                                                                fit: BoxFit.contain,
                                                              ),
                                                              // Replace with your image URL
                                                            )  )
                                                      ]))

                                              ),
SizedBox(height: verticalPadding*0.3)

                                            ],
                                          ),
                                        ),
                                      ),
                                    ]
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),


    );
  }
}

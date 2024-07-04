// import 'package:fleetmasta/components/evidence_view.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../components/app_menu.dart';
// import '../components/custom_tab.dart';
// import '../components/profile_popup.dart';
// import '../const/colors.dart';
// import '../const/custom_text.dart';
// import '../components/profile_card.dart';
// import '../components/profile_view_table.dart';
// import '../controllers/profile_view_controller.dart';
//
// class ViewProfileScreen1 extends StatelessWidget {
//   final ProfileViewController controller = Get.put(ProfileViewController());
//
//   ViewProfileScreen1({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//     final mediaQuery = MediaQuery.of(context);
//     final height = mediaQuery.size.height;
//     final screenWidth = mediaQuery.size.width;
//     return SafeArea(
//       child: Scaffold(
//         key: _scaffoldKey,
//         drawer: CustomDrawer(
//           onHomeTap: () {},
//           onDashboardTap: () {},
//           onContactTap: () {},
//           onSettingsTap: () {},
//         ),
//         body: SingleChildScrollView(
//           child: Container(
//             width: double.infinity,
//             decoration: BoxDecoration(
//               color: Appcolor.purple,
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Padding(
//                   padding: EdgeInsets.all(screenWidth * 0.025),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       SizedBox(height: height * 0.05),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           IconButton(
//                             icon: const Icon(Icons.menu, color: Colors.white, size: 30),
//                             onPressed: () {
//                               _scaffoldKey.currentState?.openDrawer();
//                             },
//                           ),
//                           IconButton(
//                             icon: const Icon(Icons.account_circle, color: Colors.white),
//                             onPressed: () {
//                               showDialog(
//                                 context: context,
//                                 builder: (BuildContext context) {
//                                   return ProfilePopup(
//                                     onProfileTap: () {
//                                       Navigator.of(context).pop();
//                                     },
//                                     onLogoutTap: () {
//                                       Navigator.of(context).pop();
//                                     },
//                                   );
//                                 },
//                               );
//                             },
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: height * 0.02),
//                       heading('View Profile'),
//                       SizedBox(height: height * 0.02),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   decoration: BoxDecoration(
//                     color: Appcolor.bg,
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(40),
//                       topRight: Radius.circular(40),
//                     ),
//                   ),
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.025),
//                     child: Column(
//                       children: [
//                         SizedBox(height: 20),
//                         lightBack("Driver details"),
//                         SizedBox(height: height * 0.02),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: const ProfileStatusCard(),
//                         ),
//                         SizedBox(height: height * 0.02),
//                         Obx(() {
//                           return HorizontalButtonList(
//                             categories: controller.categories,
//                             onCategorySelected: (category) {
//                               int index = controller.categories.indexOf(category);
//                               controller.selectCategory(index);
//                             },
//                             initialIndex: controller.selectedIndex.value,
//                           );
//                         }),
//                         SizedBox(height: height * 0.02),
//                         Obx(() {
//                           return lightBack(controller.currentTabTitle.value); // Dynamically change the text
//                         }),
//                         SizedBox(height: height * 0.02),
//                         SizedBox(
//                           height: 900,
//                           child: PageView.builder(
//                             itemCount: controller.categories.length,
//                             controller: controller.pageController,
//                             onPageChanged: controller.onPageChanged,
//                             itemBuilder: (context, index) {
//                               return _buildContent(controller.categories[index]);
//                             },
//                           ),
//                         ),
//
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildContent(String category) {
//     final ProfileViewController controller = Get.find();
//     // Get the details for the selected category, or show a default message if none exist
//     List<Map<String, String>>? details = controller.categoryDetails[category];
//     if (controller.currentTabTitle.value == "Upload evidence") {
//       return EvidenceUpload();
//     }
//     if (details == null) {
//       return Center(
//         child: Text(
//           'No details available for $category',
//           style: TextStyle(fontSize: 15),
//         ),
//       );
//     }
//
//     return EmployeeDetailsCard(details: details);
//   }
// }
//

import 'package:fleetmasta/components/custom_txtbox.dart';
import 'package:fleetmasta/components/data_table.dart';
import 'package:fleetmasta/components/evidence_view.dart';
import 'package:fleetmasta/components/logout_popup.dart';
import 'package:fleetmasta/components/notification_popup.dart';
import 'package:fleetmasta/components/pagination.dart';
import 'package:fleetmasta/const/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../components/app_menu.dart';
import '../components/custom_tab.dart';
import '../components/profile_popup.dart';
import '../const/colors.dart';
import '../const/custom_text.dart';
import '../components/profile_card.dart';
import '../components/profile_view_table.dart';
import '../controllers/profile_view_controller.dart';

class AllExpensesScreen extends StatelessWidget {
  final ProfileViewController controller = Get.put(ProfileViewController());

  AllExpensesScreen({Key? key}) : super(key: key);
  final List<Map<String, String>> data = [
    {'S#': '1', 'Expense purpose': 'Arshik', 'Date': '5644645', 'Currency': 'GBP', 'Expense Cost': '265\$', 'Status': 'true', 'CreatedAt': '7/1/2024', 'Action': 'Ok'},
    {'S#': '2', 'Expense purpose': 'John', 'Date': '9876543', 'Currency': 'USD', 'Expense Cost': '120\$', 'Status': 'false', 'CreatedAt': '6/15/2024', 'Action': 'Pending'},
    // Add more data entries as needed
  ];

  final List<String> columns = ['S#', 'Expense purpose', 'Date', 'Currency', 'Expense Cost', 'Status', 'CreatedAt', 'Action'];
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(screenWidth * 0.025),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                          Row(children: [
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
                              icon: Image.asset("assets/images/user-thumb.png" , width: 20,color: Appcolor.white,),
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
                          ],)
                        ],
                      ),
                      SizedBox(height: height * 0.02),
                      Row(
                        children: [
                          SizedBox(width: 17,),
                          Image.asset('assets/images/dashboard.png'),
                          SizedBox(width: 10,),
                          noraml("/Expenses")
                        ],
                      ),
                      SizedBox(height: height * 0.02),
                      SizedBox(height: height * 0.02),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Appcolor.bg,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.025),
                    child: Column(
                      children: [
                        SizedBox(height: 20,),
                        lightBack( "All Expenses"),
                        SizedBox(height: 20,),
                        SizedBox(
                          width: 200,
                            child: gradientButton(onPressed: (){
                              Get.toNamed('addAssestsScreen');
                            }, text:  "Add new expenses")),
                        SizedBox(height: 10,),
                      Row(
                        children: [
                          Expanded(
                            child:grayTex1('Show')
                          ),
                          Expanded(
                             flex: 1,
                            child: Searchbar(),
                          ),
                        ],
                      ),
                        SizedBox(height: 30,),
                        Container(
                          decoration:  BoxDecoration(
                            color: Appcolor.bbg1,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                               ExpenseTable(data: data, columns:columns,),
                                SizedBox(height: 10,),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                  grayTex1("Show 1 to 10 of 31 entries "),
                                  PaginationDemo(),
                                ],)

                              ],
                            ),
                          ),
                        ),
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


}



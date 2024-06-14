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

import 'package:fleetmasta/components/evidence_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/app_menu.dart';
import '../components/custom_tab.dart';
import '../components/profile_popup.dart';
import '../const/colors.dart';
import '../const/custom_text.dart';
import '../components/profile_card.dart';
import '../components/profile_view_table.dart';
import '../controllers/profile_view_controller.dart';

class ViewProfileScreen1 extends StatelessWidget {
  final ProfileViewController controller = Get.put(ProfileViewController());

  ViewProfileScreen1({Key? key}) : super(key: key);

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
                      heading('View Profile'),
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
                        SizedBox(height: 20),
                        lightBack("Driver details"),
                        SizedBox(height: height * 0.02),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: const ProfileStatusCard(),
                        ),
                        SizedBox(height: height * 0.02),
                        Obx(() {
                         return HorizontalButtonList(
                            categories: controller.categories,
                            onCategorySelected: (category) {
                              int index = controller.categories.indexOf(category);
                              controller.selectCategory(index);
                            },
                            initialIndex: controller.selectedIndex.value,
                          );
                        }),
                        SizedBox(height: height * 0.02),
                        Obx(() {
                          return lightBack(controller.currentTabTitle.value); // Dynamically change the text
                        }),
                        SizedBox(height: height * 0.02),
                        Obx(() {
                          return _buildContent(controller.categories[controller.selectedIndex.value]);
                        }),
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

  Widget _buildContent(String category) {
    final ProfileViewController controller = Get.find();
    // Get the details for the selected category, or show a default message if none exist
    List<Map<String, String>>? details = controller.categoryDetails[category];
    if (controller.currentTabTitle.value == "Upload evidence") {
      return EvidenceUpload();
    }
    if (details == null) {
      return Center(
        child: Text(
          'No details available for $category',
          style: TextStyle(fontSize: 15),
        ),
      );
    }

    return EmployeeDetailsCard(details: details);
  }
}



import 'package:fleetmasta/const/colors.dart';
import 'package:fleetmasta/const/custom_button.dart';
import 'package:fleetmasta/const/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  List<String> images = [
    'assets/images/image.png',
    'assets/images/image2.png',
    'assets/images/image1.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.white,
      body: Column(
        children: [
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              height: 470,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: PageView.builder(
                      controller: _pageController,
                      onPageChanged: (index) {
                        setState(() {
                          _currentPage = index;
                        });
                      },
                      itemCount: images.length,
                      itemBuilder: (context, index) {
                        return Stack(
                          children: [
                            Image.asset(
                              images[index],
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                            Positioned(
                              top: 15,
                              left: 120,
                              child: Image.asset(
                                'assets/images/FM-Icon.png', // Replace with your logo asset path
                                height: 100,
                                width: 100,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  Positioned(
                    bottom: 20.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(images.length, (index) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 4.0),
                          width: 16.0,
                          height: 16.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentPage == index
                                ? Appcolor.purple
                                : Colors.grey,
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 25),
          welcomeText('Welcome to the'),
          SizedBox(height: 70),
          Container(
            width: 200,
            child: CustomButton(
              text: 'Get Started',
              onPressed: () {
                Get.toNamed('/loginScreen');
              },
            ),
          ),
          Spacer(),
          RichText(
            text: TextSpan(
              style: TextStyle(fontSize:13, color:Appcolor.lightBlack), // Default text style
              children: [
                TextSpan(text: 'Name: FleetMasta | Version: '),
                TextSpan(
                  text: ' v2.2',
                  style: TextStyle(color:Appcolor.purple), // Change color for "v2.2"
                ),
                TextSpan(text: ' | Date:'),
                TextSpan(
                  text: ' 28 June 2023',
                  style: TextStyle(color:Appcolor.purple), // Change color for the date
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }


}





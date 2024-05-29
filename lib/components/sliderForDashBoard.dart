import 'package:flutter/material.dart';

import '../const/colors.dart';

class Sliderfordashboard extends StatefulWidget {
  const Sliderfordashboard({super.key});

  @override
  State<Sliderfordashboard> createState() => _SliderfordashboardState();
}

class _SliderfordashboardState extends State<Sliderfordashboard> {
  int currentIndex = 0;
  final PageController controller = PageController();
  List<String> image = ["assets/icons/icon_person.png","assets/icons/dashBoardCarIcon.png"];
  @override
  Widget build(BuildContext context) {
    return Column(
        children:[
          Container(
      height: 300,
      width: 200,
      color: Appcolor.grey,
      child: PageView.builder(
        controller: controller,
        onPageChanged: (index){
          setState(() {
            currentIndex = index % image.length;
          });
        },
          itemCount: image.length,
          itemBuilder: (context, index){
      return SizedBox(
        height: 100,
        width: double.infinity,
        child: Container(
            height: 70,
            width: 200,
            color: Appcolor.grey,
            child: Row(
                children: [
                  Expanded(
                      flex:1,
                      child: Container(color: Appcolor.borderColor,)
                  ),Expanded(
                    flex:6,
                    child: Center(
                      child: Text("hello", style: TextStyle(
                          fontSize: 20
                      ),),
                    ),)

                ]),
        ),
      );      
    })
    ),
        SizedBox(height: 10,),
          // Row(children: [
          //   for(var i =0; i<image.length; i++)
          //     buildIndictor(currentIndex == i)
          // ],),
          Padding(padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed: (){ controller.jumpToPage(currentIndex - 1);
                }, icon: Icon(Icons.arrow_back),
              ),
              IconButton(onPressed: (){controller.jumpToPage(currentIndex + 1);}, icon: Icon(Icons.arrow_forward),
              )
            ],
          ),
          )
        ]);
  }
  Widget buildIndictor(bool isSelected){
    return Container(
      height: isSelected? 12:8,
      width: isSelected? 12: 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelected? Appcolor.black: Appcolor.grey,
      ),
    );
  }
}

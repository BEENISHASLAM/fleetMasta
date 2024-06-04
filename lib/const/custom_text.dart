import 'package:flutter/material.dart';

import 'colors.dart';

Widget headingText(String? title){
  return Text(title!, style: TextStyle(fontWeight: FontWeight.w500,color:Appcolor.white,fontSize: 22.0),);
}Widget whiteText(String? title){
  return Text(title!, style: TextStyle(fontWeight: FontWeight.w500,color:Appcolor.white,fontSize: 14.0),);
}
Widget heading(String? title){
  return Text(title!, style: TextStyle(fontWeight: FontWeight.w700,color:Appcolor.lightGrey,fontSize: 20.0),);
}Widget normalText1(String? title){
  return Text(title!, style: TextStyle(fontWeight: FontWeight.w500,color:Appcolor.lightBlack,fontSize: 40.0),);
}

Widget noraml(String? title){
  return Text(title!, style: TextStyle(color:Appcolor.white,fontSize: 15.0),);
}
Widget grayText(String? title){
  return Text(title!, style: TextStyle(fontWeight: FontWeight.w700,color:Appcolor.lightBlack,fontSize: 15.0),);
}Widget purpleText(String? title){
  return Text(title!, style: TextStyle(fontWeight: FontWeight.w700,color:Appcolor.purple,fontSize: 15.0),);
}
Widget grayTex1(String? title){
  return Text(title!, style: TextStyle(fontWeight: FontWeight.w500,color:Appcolor.lightBlack,fontSize: 12.0),);
}
Widget welcomeText(String? title){
  return Text(title!, style: TextStyle(fontWeight: FontWeight.w500,color:Appcolor.lightBlack,fontSize: 35.0),);
}Widget lightBack(String? title){
  return Text(title!, style: TextStyle(fontWeight: FontWeight.w500,color:Appcolor.lightBlack,fontSize: 18.0),);
}


Widget headingContainer(String? title, double? width , double? height){
  return Container(
    width:width,
    height: height,
    decoration:BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color:Appcolor.purple),
    ),
    child:Center(child: purpleText(title!)),);
}







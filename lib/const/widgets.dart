
import 'package:dotted_border/dotted_border.dart';
import 'package:fleetmasta/components/custom_txtbox.dart';
import 'package:fleetmasta/const/colors.dart';
import 'package:fleetmasta/const/custom_text.dart';
import 'package:fleetmasta/const/form_validation.dart';
import 'package:flutter/material.dart';

Widget productTile ({required text}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      decoration: BoxDecoration(
        color: Appcolor.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  lightBack('All notification'),
                  SizedBox(width: 10,),
                  grayTex1('10 mins ago'),
                ],),

                Image.asset("assets/images/dot.png"),
              ],
            ),
            SizedBox(height: 8,),
            grayTex1(text),
            SizedBox(height: 8,),

          ],
        ),
      ),
    ),
  );

}

Widget gradientButton({required text, required onPressed }){
  return GestureDetector(
    onTap: onPressed,
    child: Container(
      padding: EdgeInsets.symmetric(vertical:12.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Appcolor.purple, Appcolor.blue],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );

}


Widget GreenButton ({required text, required onPressed}){
  return ElevatedButton(
    style:ElevatedButton.styleFrom(
      backgroundColor: Appcolor.green,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0), // Rounded corners
      ),
    ),
      onPressed:onPressed,
      child: Text(text, style:  TextStyle(color:Appcolor.white),),
  );
}


Widget UploadFileTextFiled ({required onValidate}){
  return TextFormField(
  validator: onValidate,
  // onTap: onPressed,
  // controller: controller,
  // obscureText:obscureText,
  style: TextStyle(
  color: Appcolor.grey,
  fontSize: 14
  // Change the color here
  ),
  decoration: InputDecoration(
  errorStyle: const TextStyle(height: 0),
  // suffixIcon: suffixIcon,
  filled: true,
  hintStyle: TextStyle(color: Appcolor.grey),
  fillColor: Appcolor.white,
  border: OutlineInputBorder(
  borderSide: BorderSide.none,
  borderRadius: BorderRadius.circular(12.0),
// borderSide: BorderSide(color: Appcolor.white, width: 1.0),
),
errorBorder: OutlineInputBorder(
borderRadius: BorderRadius.circular(12.0),
borderSide: BorderSide(color: Colors.red),

),
focusedErrorBorder: OutlineInputBorder(
borderRadius: BorderRadius.circular(12.0),
borderSide: BorderSide(color: Colors.red),
),
),
);
}



Widget Searchbar (){
  return Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
    child: TextFormField(
        style: TextStyle(
            color: Appcolor.grey,
            fontSize: 10
          // Change the color here
        ),
    decoration: InputDecoration(
    labelText: 'Search',
    fillColor: Appcolor.white,
      hintStyle: TextStyle(color: Appcolor.grey,fontSize: 10),
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(12.0),
    ),
      filled: true,

    )),
  );

}

class UploadCard extends StatelessWidget {
  final String? title;
  final String? filename;
  final VoidCallback onFilePick;
  final bool isEditable;

  UploadCard({
    this.title,
    this.filename,
    required this.onFilePick,
    this.isEditable = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: Column(
        children: [
          Container(
            width: 300,
            child: Align(
              alignment: Alignment.center,
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: title,
                      style: TextStyle(
                        color: Appcolor.lightBlack,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text: '*',
                      style: TextStyle(
                        color: Appcolor.purple,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          DottedBorder(
            color: Appcolor.grey, // Color of the border
            strokeWidth: 2, // Width of the border
            dashPattern: [6, 3], // Pattern of the dashed border
            borderType: BorderType.Rect, // Border type
            radius: const Radius.circular(12),
            child: GestureDetector(
              onTap: isEditable ? onFilePick : null,
              child: Container(
                width: 280,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                  color: Appcolor.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.cloud_upload_outlined,
                      size: 40,
                      color: Appcolor.grey,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      filename != null ? filename! : 'Choose file to upload',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        color: Appcolor.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



Widget iconButton({ backgroundColor, required onPressed, required color, required icon }){

  return Container(
    decoration: BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(12),
    ),
    child: IconButton(
      icon: Icon(
        Icons.add,
        size: 12,
      ),
      onPressed: onPressed,
    ),
  );
}



class CurstomIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final backgroundColor;
  final Widget icon;
  final double borderRadius;
  final Color iconColor;

  CurstomIconButton({
    required this.onPressed,
    required this.backgroundColor,
    required this.icon,
    this.borderRadius = 8,
    required this.iconColor
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: IconButton(
        icon: icon,
        color: iconColor,
        onPressed: onPressed,
      ),
    );
  }
}



Widget addInvoices ({
  required TextEditingController qtyController,
  required TextEditingController priceController,
  required TextEditingController totalPriceController,
  required Function(String) onQtyChanged,
  required Function(String) onPriceChanged,
} )
{
  return Container(
    decoration: BoxDecoration(
        color: Appcolor.pink
    ),
    child: Column(
      children: [
        Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'S#',
                        style: TextStyle(
                          color: Appcolor.lightBlack,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: '*',
                        style: TextStyle(
                          color: Appcolor.purple,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 5,),
              CustomTextBox(
                readOnly: true,
                onValidate:(str){
                  return HelperFunction.checkFirstName(str);
                },
                controller:null ,
                hintText: '1',
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'item',
                        style: TextStyle(
                          color: Appcolor.lightBlack,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: '*',
                        style: TextStyle(
                          color: Appcolor.purple,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 5,),
              CustomTextBox(
                onValidate:(str){
                  return HelperFunction.checkFirstName(str);
                },
                controller:null ,
                hintText: 'Enter item name',
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Qty',
                        style: TextStyle(
                          color: Appcolor.lightBlack,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: '*',
                        style: TextStyle(
                          color: Appcolor.purple,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 5,),
              CustomTextBox(
               onChanged: onQtyChanged,
                onValidate:(str){
                  return HelperFunction.checkFirstName(str);
                },
                controller:qtyController,
                hintText: 'Enter qty',
                keyboardType: TextInputType.number,
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Price',
                        style: TextStyle(
                          color: Appcolor.lightBlack,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: '*',
                        style: TextStyle(
                          color: Appcolor.purple,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 5,),
              CustomTextBox(
               onChanged: onPriceChanged,
                onValidate:(str){
                  return HelperFunction.checkFirstName(str);
                },
                controller:priceController,
                hintText: 'Enter unit price',
                keyboardType: TextInputType.number,
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Total',
                        style: TextStyle(
                          color: Appcolor.lightBlack,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: '*',
                        style: TextStyle(
                          color: Appcolor.purple,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 5,),
              CustomTextBox(
                readOnly: true,
                // onValidate:(str){
                //   return HelperFunction.checkFirstName(str);
                // },
                controller:totalPriceController,
                hintText: '',
              ),
            ],
          ),
        ),

        SizedBox(height: 20,),


      ],
    ),);
}



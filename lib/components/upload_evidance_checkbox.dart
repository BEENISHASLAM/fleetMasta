import 'package:fleetmasta/controllers/check_box_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fleetmasta/const/colors.dart';

class UploadEvidanceCheckBox extends StatelessWidget {
  final String rememberMeText;
  final String? forgotPasswordText;
  final CheckboxController checkboxController = Get.put(CheckboxController());

  UploadEvidanceCheckBox({
    Key? key,
    required this.rememberMeText,
    this.forgotPasswordText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Row(
            children: [
              Obx(() => Checkbox(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                value: checkboxController.isChecked1.value,
                side: BorderSide(color: Appcolor.grey),
                onChanged: (bool? value) {
                  checkboxController.toggleCheckbox1(value);
                },
              )),
              Flexible(
                child: Text(
                  rememberMeText,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Appcolor.lightBlack,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 10,
                ),
              ),
            ],
          ),
        ),

      ],
    );
  }
}

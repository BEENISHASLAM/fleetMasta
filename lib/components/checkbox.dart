import 'package:fleetmasta/controllers/check_box_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fleetmasta/const/colors.dart';

class RememberMeForgotPassword extends StatelessWidget {
  final String rememberMeText;
  final String? forgotPasswordText;
  final CheckboxController checkboxController = Get.put(CheckboxController());

  RememberMeForgotPassword({
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
                value: checkboxController.isChecked.value,
                side: BorderSide(color: Appcolor.grey),
                onChanged: (bool? value) {
                  checkboxController.toggleCheckbox(value);
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
        if (forgotPasswordText != null)
          GestureDetector(
            onTap: () {
              Get.toNamed('/forgotPassScreen');
            },
            child: Text(
              forgotPasswordText!,
              style: const TextStyle(
                fontSize: 14,
                color: Color.fromRGBO(196, 39, 144, 1),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../const/colors.dart';

class SliderController extends GetxController {
  var currentSliderValue = 1.0.obs;

  void updateSliderValue(double newValue) {
    currentSliderValue.value = newValue;
  }
}

class CustomSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SliderController sliderController = Get.put(SliderController());

    return Container(
      width: 600,
      child: Obx(() =>
          Slider(
            value: sliderController.currentSliderValue.value,
            min: 1,
            max: 11,
            divisions: 9,
            label: sliderController.currentSliderValue.value.round().toString(),
            onChanged: (newValue) {
            //  sliderController.updateSliderValue(newValue);
            },
            activeColor: Appcolor.white, // Active track color
            inactiveColor: Appcolor.pink, // Inactive track color
            thumbColor: Colors.white, // Thumb color
          ),
      ),
    );
  }
}

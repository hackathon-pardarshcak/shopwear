import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:weight_slider/weight_slider.dart';

import '../../../../Utils/string_constants.dart';
import '../../../CustomWidgets/common_button.dart';
import '../../../CustomWidgets/custom_appbar.dart';

class WeightMeasurementView extends StatefulWidget {
  const WeightMeasurementView({Key? key}) : super(key: key);

  @override
  State<WeightMeasurementView> createState() => _WeightMeasurementViewState();
}

class _WeightMeasurementViewState extends State<WeightMeasurementView> {
  RxInt weight = 70.obs;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: commonAppBarTxt(context,enterMeasurement, false),
          body: Obx(()=>
              SingleChildScrollView(
                child: Column(
                  children: [
                    weightWidget(),
                    commonButton(context, 'NEXT', () {}
                    )
                  ],
                ),
              ),
          )
      ),
    );
  }

  Widget weightWidget() {
    return Column(
      children: [
        Padding(padding: EdgeInsets.only(top: 29),child: Center(child: Image.asset(weightImage)),),
        Padding(padding: EdgeInsets.only(top: 25,left: 53),child: Align(alignment:Alignment.centerLeft,child: Text(selectWeight.toLowerCase())),),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: WeightSlider(
            weight: weight.value,
            minWeight: 30,
            maxWeight: 100,
            onChange: (val) {
              weight.value = val;
              print('Weight${weight}');
            },
            unit: 'kg', // optional
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopwear/UI/CustomWidgets/common_button.dart';
import 'package:shopwear/UI/CustomWidgets/custom_appbar.dart';
import 'package:shopwear/Utils/string_constants.dart';
import 'package:weight_slider/weight_slider.dart';


class MeasurementScreen extends StatefulWidget {
  const MeasurementScreen({Key? key}) : super(key: key);

  @override
  State<MeasurementScreen> createState() => _MeasurementScreenState();
}


class _MeasurementScreenState extends State<MeasurementScreen> {
  RxInt weight = 70.obs;
  RxInt height = 150.obs;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: commonAppBarTxt(context,enterMeasurement, false),
          body: Obx(()=>
            SingleChildScrollView(
              child: Column(
                children: [
                  heightWidget(),
                  weightWidget(),
                  commonButton(context, 'NEXT', () { print('object');})
                ],
              ),
            ),
          )
        ),
    );
  }


  Widget heightWidget() {
    return Column(
      children: [
        Padding(padding: EdgeInsets.only(top: 29,),child: Center(child: Image.asset(heightImage)),),
        Padding(padding: EdgeInsets.only(top: 25,left: 53),child: Align(alignment:Alignment.centerLeft,child: Text(selectHeight)),),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: WeightSlider(
            weight: height.value,
            minWeight: 121,
            maxWeight: 213,
            onChange: (val) {height.value = val;print('Height${height}');},
            unit: 'cm', // optional
          ),
        ),

      ],
    );
  }
  Widget weightWidget() {
    return Column(
      children: [
        Padding(padding: EdgeInsets.only(top: 29,),child: Center(child: Image.asset(weightImage)),),
        Padding(padding: EdgeInsets.only(top: 25,left: 53),child: Align(alignment:Alignment.centerLeft,child: Text(selectWeight)),),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: WeightSlider(
            weight: weight.value,
            minWeight: 30,
            maxWeight: 100,
            onChange: (val) {weight.value = val;print('Weight${weight}');},
            unit: 'kg', // optional
          ),
        ),
      ],
    );
  }


}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopwear/UI/CustomWidgets/common_button.dart';
import 'package:shopwear/UI/CustomWidgets/custom_appbar.dart';
import 'package:shopwear/UI/View/DetailScreenModule/View/weight_screen.dart';
import 'package:shopwear/Utils/string_constants.dart';
import 'package:weight_slider/weight_slider.dart';


class MeasurementScreen extends StatefulWidget {
  const MeasurementScreen({Key? key}) : super(key: key);

  @override
  State<MeasurementScreen> createState() => _MeasurementScreenState();
}


class _MeasurementScreenState extends State<MeasurementScreen> {
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
                ],
              ),
            ),
          ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.only(bottom: 50,left: 50,right: 50),
              child: commonButton(context, 'NEXT', () {
             Navigator.of(context).push(MaterialPageRoute(builder: (context) => Weightmeasurement()));
      }),
       )
        ),
    );
  }


  Widget heightWidget() {
    return Column(
      children: [
        Padding(padding: EdgeInsets.only(top: 120,),child: Center(child: Image.asset(heightImage,height: 150,width: 150)),),
        Padding(padding: EdgeInsets.only(top: 100,left: 53),child: Align(alignment:Alignment.centerLeft,child: Text(selectHeight)),),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: WeightSlider(
            weight: height.value,
            minWeight: 121,
            maxWeight: 213,
            onChange: (val) {
              height.value = val;
              print('Height${height}');},
              unit: 'cm', // optional
          ),
        ),

      ],
    );
  }

}

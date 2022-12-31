import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:weight_slider/weight_slider.dart';

import '../../../../Utils/string_constants.dart';
import '../../../CustomWidgets/common_button.dart';
import '../../../CustomWidgets/custom_appbar.dart';
import '../../TopWearModule/View/topProducts_screen.dart';

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
                  ],
                ),
              ),
          ),
        bottomNavigationBar: Padding(
         padding: const EdgeInsets.only(bottom: 50,left: 50,right: 50),
         child: commonButton(context, 'NEXT', () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => TopProductsListing()));
          }),
       )
      ),
    );
  }

  Widget weightWidget() {
    return Column(
      children: [
        Padding(padding: EdgeInsets.only(top: 60),child: Center(
            child: Image.asset(weightImage,height: 200,
              width: 200,)),),
        Padding(padding: EdgeInsets.only(top: 100,left: 53),child: Align(alignment:Alignment.centerLeft,child: Text(selectWeight)),),
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

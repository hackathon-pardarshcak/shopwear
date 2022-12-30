import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopwear/UI/View/DetailScreenModule/View/weight_view.dart';

import '../../../../Config/Services/network_manager.dart';
import '../../../../Utils/error_screen.dart';

class Weightmeasurement extends StatefulWidget {
  const Weightmeasurement({Key? key}) : super(key: key);

  @override
  State<Weightmeasurement> createState() => _WeightmeasurmentState();
}

class _WeightmeasurmentState extends State<Weightmeasurement>  with WidgetsBindingObserver{
  final GetXNetworkManager networkManager = Get.find<GetXNetworkManager>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GetBuilder<GetXNetworkManager>(
          // ignore: unrelated_type_equality_checks
            builder: (builder) => networkManager.connectionType == 0
                ? const SomethingWentWrong()
                :  WeightMeasurementView()
        )


    );
  }
}

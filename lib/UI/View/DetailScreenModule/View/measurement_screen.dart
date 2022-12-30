import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../../Config/Services/network_manager.dart';
import '../../../../Utils/error_screen.dart';
import 'measurement_view.dart';

class MeasurementView extends StatefulWidget {
  const MeasurementView({Key? key}) : super(key: key);

  @override
  State<MeasurementView> createState() => _MeasurementViewState();
}

class _MeasurementViewState extends State<MeasurementView>
    with WidgetsBindingObserver {
  final GetXNetworkManager networkManager = Get.find<GetXNetworkManager>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GetBuilder<GetXNetworkManager>(
            // ignore: unrelated_type_equality_checks
            builder: (builder) => networkManager.connectionType == 0
                ? const SomethingWentWrong()
                :  MeasurementScreen()
        )


    );
  }
}

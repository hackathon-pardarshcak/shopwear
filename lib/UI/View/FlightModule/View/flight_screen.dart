import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Config/Services/network_manager.dart';
import '../../../../Utils/error_screen.dart';
import 'flight_view.dart';

class FlightScreen extends StatefulWidget {
  const FlightScreen({Key? key}) : super(key: key);

  @override
  State<FlightScreen> createState() => _FlightScreenState();
}

class _FlightScreenState extends State<FlightScreen> {

  final GetXNetworkManager networkManager = Get.find<GetXNetworkManager>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GetBuilder<GetXNetworkManager>(
          // ignore: unrelated_type_equality_checks
            builder: (builder) => networkManager.connectionType == 0
                ? const SomethingWentWrong()
                : const FlightView()
        )
    );
  }
}

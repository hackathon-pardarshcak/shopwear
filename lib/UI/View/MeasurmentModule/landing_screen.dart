import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../Config/Services/network_manager.dart';
import '../../../Utils/app_colors.dart';
import '../../../Utils/error_screen.dart';
import '../../../Utils/string_constants.dart';
import '../../CustomWidgets/common_button.dart';
import '../DetailScreenModule/View/measurement_view.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> with WidgetsBindingObserver{


  final GetXNetworkManager networkManager = Get.find<GetXNetworkManager>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetXNetworkManager>(
        builder: (builder) => networkManager.connectionType == 0
        ? const SomethingWentWrong()
        :SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 70.0, left: 109.0, right: 109.0),
                child: Text(helloTxt,
                    style: TextStyle(
                        color: AppColors.bgWhite,
                        fontSize: 30,
                        fontWeight: FontWeight.w900),
                    textAlign: TextAlign.center),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 37.0, right: 37.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text(measurementTxt,
                          style: TextStyle(
                              color: AppColors.bgWhite,
                              fontSize: 24,
                              fontWeight: FontWeight.w800),
                          textAlign: TextAlign.center),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10,top: 20),
                      child: Image.asset(
                        drawerImg,
                        height: 300,
                        width: 300,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
          bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 50,right: 50,left: 50),
            child: commonWhiteButton(context, tapTOMeasureTxt, () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => MeasurementScreen()),
          );}),
        ),
      ),
        ),
    );
  }
}

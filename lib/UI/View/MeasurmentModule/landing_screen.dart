import 'package:flutter/material.dart';
import '../../../Utils/app_colors.dart';
import '../../../Utils/string_constants.dart';
import '../../CustomWidgets/common_button.dart';
import '../DetailScreenModule/View/measurement_view.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.bgWhite,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding:
                  const EdgeInsets.only(top: 52.0, left: 109.0, right: 109.0),
                  child: Text(helloTxt,
                      style: TextStyle(
                          color: AppColors.bgBlack,
                          fontSize: 24,
                          fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 37.0, right: 37.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 85.0),
                        child: Text(measurementTxt,
                            style: TextStyle(
                                color: AppColors.bgBlack,
                                fontSize: 24,
                                fontWeight: FontWeight.w800),
                            textAlign: TextAlign.center),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 19.0),
                        child: Image.asset(
                          drawerImg,
                          height: 300,
                          width: 300,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 70.0,
                        ),
                        child:commonButton(context,tapTOMeasureTxt.toUpperCase(),() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MeasurementScreen()),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

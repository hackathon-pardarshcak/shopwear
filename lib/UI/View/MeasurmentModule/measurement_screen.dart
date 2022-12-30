import 'package:flutter/material.dart';
import 'package:getxdemo/UI/View/GridViewScreen/View/gridview.dart';
import 'package:getxdemo/Utils/app_colors.dart';
import 'package:getxdemo/Utils/common_style.dart';

import '../../../Utils/string_constants.dart';

class MeasurementScreen extends StatefulWidget {
  const MeasurementScreen({Key? key}) : super(key: key);

  @override
  State<MeasurementScreen> createState() => _MeasurementScreenState();
}

class _MeasurementScreenState extends State<MeasurementScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 52.0, left: 109.0, right: 109.0),
              child: Text('Hello\n\nIPSIANS',
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
                    child: Text("Let's change ecommerce experience",
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
                    child: SizedBox(
                      height: 67,
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        child: Text('TAP TO MEASURE',
                            style: TextStyle(
                                color: AppColors.bgWhite,
                                fontSize: 20,
                                fontWeight: FontWeight.w400),
                            textAlign: TextAlign.center),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Gridview()),
                          );
                        },
                        style: measurementBtnStyle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../Utils/common_function.dart';

class FlightDetail extends StatefulWidget {
  FlightDetail({
    Key? key,
  }) : super(key: key);

  @override
  State<FlightDetail> createState() => _FlightDetailState();
}

class _FlightDetailState extends State<FlightDetail> {
  var logoData = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Flight Details'),
          ),
      body: Hero(
        tag: 'Airline Images',
        child: Center(
          child: SizedBox(
            width: 100.0,
            height: 100.0,
            child: imageLoad(logoData),
          ),
        ),
      ),
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Network/NetworkHandler/network_binding.dart';
import 'UI/View/AllProductsModule/View/allproducts_screen.dart';
import 'UI/View/DetailScreenModule/View/measurement_screen.dart';

import 'UI/View/MeasurmentModule/landing_screen.dart';

void main() {
  runApp( const MyApp());

}

class MyApp extends StatelessWidget {
   const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialBinding: NetworkBinding(),
      theme: ThemeData.light(),
      // fallbackLocale: const Locale('en', 'US'),
      home: const LandingScreen(),
    );
  }
}

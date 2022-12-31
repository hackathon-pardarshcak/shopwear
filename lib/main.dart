import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Network/NetworkHandler/network_binding.dart';
import 'UI/View/SplashScreen/splashscreen.dart';
import 'UI/View/GridViewScreen/View/topWereGridView.dart';

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
      home: const SplashScreen()
    );
  }
}

import 'package:flutter/material.dart';

import '../MeasurmentModule/landing_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int splashtime = 3;

  @override
  void initState() {
    Future.delayed(Duration(seconds: splashtime), () async {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => LandingScreen()));
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 0.050;
    return Scaffold(
      body: SafeArea(
        child: splashScreen(height),
      ),
    );
  }

  Stack splashScreen(double height) {
    return Stack(
      children: [
        Center(
            child: Image.asset('assets/Images/PNG/drawerImage.png',height: 500,width: 500,)
        ),
      ],
    );
  }
}




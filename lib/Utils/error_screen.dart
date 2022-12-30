import 'package:flutter/material.dart';
import 'package:getxdemo/Utils/string_constants.dart';
import '../UI/CustomWidgets/custom_container.dart';

// ignore: must_be_immutable
class SomethingWentWrong extends StatefulWidget {
  const SomethingWentWrong({Key? key,}) : super(key: key);
  @override
  State<SomethingWentWrong> createState() => _SomethingWentWrongState();
}

class _SomethingWentWrongState extends State<SomethingWentWrong> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            customImageContainer(noInternetImage,context),
            customTextContainer(context,pleaseTryAgain),
          ],
        ),
      ),
    );
  }
}

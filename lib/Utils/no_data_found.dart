import 'package:flutter/material.dart';
import 'package:getxdemo/Utils/string_constants.dart';
import '../UI/CustomWidgets/custom_container.dart';

// ignore: must_be_immutable
class NoDataFound extends StatefulWidget {
  const NoDataFound({Key? key,}) : super(key: key);
  @override
  State<NoDataFound> createState() => _NoDataFoundState();
}

class _NoDataFoundState extends State<NoDataFound> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            customImageContainer(noDataFound,context),
            customTextContainer(context,errorMessage),
          ],
        ),

      ),
    );
  }
}

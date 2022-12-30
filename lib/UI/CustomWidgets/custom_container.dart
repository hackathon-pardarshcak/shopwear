import 'package:flutter/material.dart';

import '../../Utils/common_function.dart';
import 'custom_text.dart';

Widget customImageContainer(String imagePath, BuildContext context) {
  return Container(
    color: Colors.white,
    padding: EdgeInsets.only(
      top: MediaQuery.of(context).size.height/10,
      bottom: MediaQuery.of(context).size.height/4,
      left: MediaQuery.of(context).size.width/10,
      right: MediaQuery.of(context).size.width/10,
    ),
    child: imageLoad(imagePath),
  );
}

Widget customTextContainer(BuildContext context, String text) {
  return Container(
    padding: EdgeInsets.only(
      top: MediaQuery.of(context).size.height/3,
      bottom: 0,
      left: MediaQuery.of(context).size.width/10,
      right: MediaQuery.of(context).size.width/10,
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children:  [
        customTextErrorScreen(text)
      ],
    ),
  );
}
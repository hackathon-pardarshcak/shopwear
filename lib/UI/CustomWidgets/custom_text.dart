import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget customText(String data) {
  return Text(data);
}

Widget customTextErrorScreen(String text) {
  return Text(
    text,
    maxLines: 4,
    textAlign: TextAlign.center,
    style: const TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 30,
       color: Color(0xff2f3640),
    ),
  );
}


import 'package:flutter/material.dart';

import '../../Utils/app_colors.dart';
import '../../Utils/common_style.dart';

Widget commonButton(BuildContext context,btnText,GestureTapCallback onBtnClick,){
  return SizedBox(
    height: 67,
    width: MediaQuery.of(context).size.width,
    child: ElevatedButton(
      onPressed: () {
        onBtnClick();
      },
      style: measurementBtnStyle,
      child: Text(btnText,
          style: TextStyle(
              color: AppColors.bgWhite,
              fontSize: 20,
              fontWeight: FontWeight.w400),
          textAlign: TextAlign.center),
    ),
  );
}
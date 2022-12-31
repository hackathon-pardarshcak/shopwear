
import 'package:flutter/material.dart';

import '../../Utils/app_colors.dart';
import '../../Utils/common_style.dart';

Widget commonWhiteButton(BuildContext context,btnText,GestureTapCallback onBtnClick,){
  return SizedBox(
    height: 67,
    width: MediaQuery.of(context).size.width,
    child: ElevatedButton(
      onPressed: () {
        onBtnClick();
      },
      style: measurementWhiteBtnStyle,
      child: Text(btnText,
          style: TextStyle(
              color: AppColors.bgBlack,
              fontSize: 20,
              fontWeight: FontWeight.w900),
          textAlign: TextAlign.center),
    ),
  );
}

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
              fontWeight: FontWeight.w900),
          textAlign: TextAlign.center),
    ),
  );
}
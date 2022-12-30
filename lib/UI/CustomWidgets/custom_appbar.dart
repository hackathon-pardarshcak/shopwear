import 'package:flutter/material.dart';
import 'package:shopwear/Utils/string_constants.dart';

import '../../Utils/app_colors.dart';

PreferredSizeWidget commonAppBarImg(BuildContext context,searchVisibility) {
  return AppBar(
    title: Image.asset(
      drawerIconImg,
      height: 54,
      width: 244,
    ),
    elevation: 0,
    centerTitle: true,
    iconTheme: IconThemeData(color: AppColors.bgBlack),
    // leading: IconButton(onPressed: (){}, icon: Icon(Icons.menu),color: AppColors.bgBlack),
    actions: [
      Visibility(
          visible: searchVisibility,
          child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
              color: AppColors.bgBlack)),
    ],
    backgroundColor: AppColors.bgWhite,
  );
}

PreferredSizeWidget commonAppBarTxt(BuildContext context,titleTxt,searchVisibility) {
  return AppBar(
    title: Text(titleTxt,style: TextStyle(
        color: AppColors.bgBlack,
        fontSize: 20,
        fontWeight: FontWeight.w400),
        textAlign: TextAlign.center),
    elevation: 0,
    centerTitle: true,
    iconTheme: IconThemeData(color: AppColors.bgBlack),
    // leading: IconButton(onPressed: (){}, icon: Icon(Icons.menu),color: AppColors.bgBlack),
    actions: [
      Visibility(
          visible: searchVisibility,
          child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
              color: AppColors.bgBlack)),
    ],
    backgroundColor: AppColors.bgWhite,
  );
}

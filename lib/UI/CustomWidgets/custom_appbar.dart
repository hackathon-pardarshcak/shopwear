import 'package:flutter/material.dart';

import '../../Utils/app_colors.dart';
import '../../Utils/drawer.dart';

PreferredSizeWidget commonAppBar(appTitle,searchVisibility,BuildContext context) {
  return AppBar(
    title: Text(
      appTitle,
      style: TextStyle(
        color: AppColors.bgBlack,
      ),
    ),
    centerTitle: true,
    iconTheme: IconThemeData(color: AppColors.bgBlack),
    actions: [
      Visibility(visible: searchVisibility,child: IconButton(onPressed: (){}, icon: Icon(Icons.search),color: AppColors.bgBlack)),
    ],
    backgroundColor: AppColors.bgWhite,
  );
}
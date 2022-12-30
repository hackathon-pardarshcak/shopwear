import 'package:flutter/material.dart';

import '../../Utils/app_colors.dart';

PreferredSizeWidget commonAppBar(appTitle,searchVisibility, BuildContext context) {
  return AppBar(
    title: Text(
      appTitle,
      style: TextStyle(
        color: AppColors.bgBlack,
      ),
    ),
    centerTitle: true,
    // leading: IconButton(onPressed: (){}, icon: Icon(Icons.menu),color: AppColors.bgBlack),
    actions: [
      Visibility(visible: searchVisibility,child: IconButton(onPressed: (){}, icon: Icon(Icons.search),color: AppColors.bgBlack)),
    ],
    backgroundColor: AppColors.bgWhite,
  );
}
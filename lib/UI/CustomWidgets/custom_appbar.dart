import 'package:flutter/material.dart';

PreferredSizeWidget commonAppBar(appTitle,searchVisibility) {
  return AppBar(
    title: Text(
      appTitle,
      style: TextStyle(
        color: Color(0xFF000000),
      ),
    ),
    centerTitle: true,
    leading: IconButton(onPressed: (){}, icon: Icon(Icons.menu),color: Color(0xFF000000)),
    actions: [
      Visibility(visible: searchVisibility,child: IconButton(onPressed: (){}, icon: Icon(Icons.search),color: Color(0xFF000000))),
    ],
    backgroundColor: Color(0xFFFFFFFF),
  );
}
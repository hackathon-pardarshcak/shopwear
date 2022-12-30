import 'package:flutter/material.dart';

import '../UI/View/GridViewScreen/View/bottomWereGridView.dart';
import '../UI/View/GridViewScreen/View/allProductsGridview.dart';
import '../UI/View/TopWearModule/View/topProducts_screen.dart';


Widget customDrawer(BuildContext context) {
    return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.scaleDown,
                  image: AssetImage("assets/Images/PNG/drawerImage.png"),
                ),
              ), child: SizedBox.shrink(),
            ),
            ListTile(
              title: const Text('Top'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => TopProductsListing()));
              },
            ),
            ListTile(
              title: const Text('Bottom'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  BottomWereGridview()));
              },
            ),
            ListTile(
              title: const Text('All products'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  AllProductsGridview()));
              },
            ),
          ],
        ),
      );
  }


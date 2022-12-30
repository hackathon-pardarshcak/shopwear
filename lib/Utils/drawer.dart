import 'package:flutter/material.dart';

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
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Bottom'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('All products'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
  }


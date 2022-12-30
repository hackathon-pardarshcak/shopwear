import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxdemo/UI/View/FlightModule/View/flight_screen.dart';

import '../../../../Utils/no_data_found.dart';
import '../../../../Utils/string_constants.dart';
import '../../../CustomWidgets/custom_loading.dart';
import '../../../CustomWidgets/custom_text.dart';
import '../View_Model/user_view_model.dart';

class UserView extends StatefulWidget {
  const UserView({Key? key}) : super(key: key);

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> with WidgetsBindingObserver {
  final userViewModel = Get.find<UserViewModel>();
  bool isDarkModeEnable = false;

  void onStateChanged(bool isDarkModeEnable) {
    setState(() {
      if(isDarkModeEnable == true) {
        this.isDarkModeEnable = isDarkModeEnable;
        Get.changeTheme(ThemeData.dark());
      } else {
        this.isDarkModeEnable = isDarkModeEnable;
        Get.changeTheme(ThemeData.light());
      }
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: userListing(userViewModel));
  }

  Widget userListing(UserViewModel userViewModel) {
    return Scaffold(
        appBar: AppBar(
          title: customText(title),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Get.to(FlightScreen());
              },
              icon: Icon(Icons.airplanemode_active)),
          actions: [
            DayNightSwitcher(
              isDarkModeEnabled: isDarkModeEnable,
              onStateChanged: onStateChanged,
            ),
          ],
        ),
        body: Obx(() => userViewModel.onError.isTrue
            ? const NoDataFound()
            : userViewModel.isLoading.value == true
                ? customLoading()
                : ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: userViewModel.userList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              customText(
                                  '$userName ${userViewModel.userList[index].name}'),
                              customText(
                                  '$customUserName ${userViewModel.userList[index].username}'),
                              customText(
                                  '$userEmail ${userViewModel.userList[index].email}'),
                            ],
                          ),
                        ),
                      );
                    })));
  }
}

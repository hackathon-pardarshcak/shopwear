import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Utils/common_function.dart';
import '../../../../Utils/no_data_found.dart';
import '../../../../Utils/string_constants.dart';
import '../../../CustomWidgets/custom_loading.dart';
import '../../../CustomWidgets/custom_text.dart';
import '../View_Model/bottomwearproducts_view_model.dart';

class BottomProductsView extends StatefulWidget with WidgetsBindingObserver{
  const BottomProductsView({Key? key}) : super(key: key);

  @override
  State<BottomProductsView> createState() => _BottomProductsViewState();
}

class _BottomProductsViewState extends State<BottomProductsView> {
  final bottomWearProductsViewModel = Get.find<BottomWearProductsViewModel>();

  bool isDarkModeEnable = false;

  void onStateChanged(bool isDarkModeEnable) {
    setState(() {
      if (isDarkModeEnable == true) {
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
    return SafeArea(child: userListing(bottomWearProductsViewModel));
  }

  Widget userListing(BottomWearProductsViewModel userViewModel) {
    return Scaffold(
        appBar: AppBar(
          title: customText(title),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {}, icon: Icon(Icons.airplanemode_active)),
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
            itemCount: userViewModel.bottomWearList.length,
            itemBuilder: (context, index) {
              return Card(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      customText(
                          '$userName ${userViewModel.bottomWearList[index].price}'),
                      customText(
                          '$customUserName ${userViewModel.bottomWearList[index].description}'),
                      customText(
                          '$userEmail ${userViewModel.bottomWearList[index].id}'),
                      imageLoad(
                          userViewModel.bottomWearList[index].image)
                    ],
                  ),
                ),
              );
            })));
  }
}

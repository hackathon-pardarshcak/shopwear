import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopwear/UI/CustomWidgets/custom_appbar.dart';

import '../../../../Utils/common_function.dart';
import '../../../../Utils/no_data_found.dart';
import '../../../../Utils/string_constants.dart';
import '../../../CustomWidgets/custom_loading.dart';
import '../../../CustomWidgets/custom_text.dart';
import '../View_Model/allProducts_view_model.dart';

class AllProductsView extends StatefulWidget {
  const AllProductsView({Key? key}) : super(key: key);

  @override
  State<AllProductsView> createState() => _AllProductsViewState();
}

class _AllProductsViewState extends State<AllProductsView> with WidgetsBindingObserver {
  final allProductsViewModel = Get.find<AllProductsViewModel>();

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
    return SafeArea(child: userListing(allProductsViewModel));
  }

  Widget userListing(AllProductsViewModel userViewModel) {
    return Scaffold(
        appBar: commonAppBarImg(context,true),
        body: Obx(() => userViewModel.onError.isTrue
            ? const NoDataFound()
            : userViewModel.isLoading.value == true
                ? customLoading()
                : ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: userViewModel.allProductList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              customText(
                                  '$userName ${userViewModel.allProductList[index].price}'),
                              customText(
                                  '$customUserName ${userViewModel.allProductList[index].description}'),
                              customText(
                                  '$userEmail ${userViewModel.allProductList[index].id}'),
                              imageLoad(
                                  userViewModel.allProductList[index].image)
                            ],
                          ),
                        ),
                      );
                    })));
  }
}

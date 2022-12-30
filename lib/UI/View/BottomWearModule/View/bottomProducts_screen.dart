import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Config/Services/network_manager.dart';
import '../../../../Utils/error_screen.dart';
import '../../GridViewScreen/View/bottomWereGridView.dart';

class BottomProductsListing extends StatefulWidget with WidgetsBindingObserver{
  const BottomProductsListing({Key? key}) : super(key: key);

  @override
  State<BottomProductsListing> createState() => _BottomProductsListingState();
}

class _BottomProductsListingState extends State<BottomProductsListing> {
  final GetXNetworkManager networkManager = Get.find<GetXNetworkManager>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<GetXNetworkManager>(
          builder: (builder) => networkManager.connectionType == 0
              ? const SomethingWentWrong()
              : const BottomWereGridview()
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxdemo/Utils/error_screen.dart';
import '../../../../Config/Services/network_manager.dart';
import '../../GridViewScreen/View/allProductsGridview.dart';


class AllProductsListing extends StatefulWidget {
  const AllProductsListing({Key? key}) : super(key: key);

  @override
  State<AllProductsListing> createState() => _AllProductsListingState();
}

class _AllProductsListingState extends State<AllProductsListing> with WidgetsBindingObserver{

  final GetXNetworkManager networkManager = Get.find<GetXNetworkManager>();

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
    return SafeArea(
      child: GetBuilder<GetXNetworkManager>(
        builder: (builder) => networkManager.connectionType == 0
            ? const SomethingWentWrong()
            : const AllProductsGridview()
      ),
    );
  }
}

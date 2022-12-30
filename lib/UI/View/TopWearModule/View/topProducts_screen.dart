import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../Config/Services/network_manager.dart';
import '../../../../Utils/error_screen.dart';
import '../../GridViewScreen/View/topWereGridView.dart';

class TopProductsListing extends StatefulWidget {
  const TopProductsListing({Key? key}) : super(key: key);

  @override
  State<TopProductsListing> createState() => _TopProductsListingState();
}

class _TopProductsListingState extends State<TopProductsListing> {
  final GetXNetworkManager networkManager = Get.find<GetXNetworkManager>();

  @override
  Widget build(BuildContext context) {
   return SafeArea(
     child: GetBuilder<GetXNetworkManager>(
         builder: (builder) => networkManager.connectionType == 0
             ? const SomethingWentWrong()
             : const TopWereGridview()
     ),
   );
  }
}

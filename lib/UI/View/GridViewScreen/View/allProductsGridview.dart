import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Utils/drawer.dart';
import '../../../CustomWidgets/custom_appbar.dart';
import '../../../CustomWidgets/custom_circularprogressindicator.dart';
import '../../../CustomWidgets/custom_gridview.dart';
import '../../AllProductsModule/View_Model/allProducts_view_model.dart';

class AllProductsGridview extends StatefulWidget {
  const AllProductsGridview({Key? key}) : super(key: key);

  @override
  State<AllProductsGridview> createState() => _AllProductsGridviewState();
}

class _AllProductsGridviewState extends State<AllProductsGridview> {

  final allProductsViewModel = Get.find<AllProductsViewModel>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    return SafeArea(
      child: Scaffold(
          appBar: commonAppBar('grid', true , context),
          drawer: customDrawer(context),
          body: Obx(()=>
          allProductsViewModel.isLoading == true ? commonCircularProgress() : allProductsGridView(context,itemWidth,itemHeight, allProductsViewModel)),
      ),
    );
  }
}

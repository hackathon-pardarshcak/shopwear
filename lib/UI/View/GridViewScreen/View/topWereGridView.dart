import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopwear/UI/View/TopWearModule/View_Model/topwearproducts_view_model.dart';
import '../../../../Utils/drawer.dart';
import '../../../CustomWidgets/custom_appbar.dart';
import '../../../CustomWidgets/custom_circularprogressindicator.dart';
import '../../../CustomWidgets/custom_gridview.dart';

class TopWereGridview extends StatefulWidget {
  const TopWereGridview({Key? key}) : super(key: key);

  @override
  State<TopWereGridview> createState() => _TopWereGridviewState();
}

class _TopWereGridviewState extends State<TopWereGridview> {

  final topWereGrid = Get.find<TopWearProductsViewModel>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    return SafeArea(
      child: Scaffold(
        appBar: commonAppBarImg(context, true),
        drawer: customDrawer(context),
        body: Obx(()=>
        topWereGrid.isLoading == true ? commonCircularProgress() : topProductsGridView(context,itemWidth,itemHeight,topWereGrid)),
      ),
    );
  }
}

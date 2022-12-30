import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxdemo/UI/View/BottomWearModule/View_Model/bottomwearproducts_view_model.dart';
import '../../../../Utils/drawer.dart';
import '../../../CustomWidgets/custom_appbar.dart';
import '../../../CustomWidgets/custom_circularprogressindicator.dart';
import '../../../CustomWidgets/custom_gridview.dart';

class BottomWereGridview extends StatefulWidget {
  const BottomWereGridview({Key? key}) : super(key: key);

  @override
  State<BottomWereGridview> createState() => _BottomWereGridviewState();
}

class _BottomWereGridviewState extends State<BottomWereGridview> {

  final bottomWereGrid = Get.find<BottomWearProductsViewModel>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    return SafeArea(
      child: Scaffold(
        appBar: commonAppBarImg(context,true),
        drawer: customDrawer(context),
        body: Obx(()=>
        bottomWereGrid.isLoading == true ? commonCircularProgress() : bottomProductsGridView(context,itemWidth,itemHeight,bottomWereGrid)),
      ),
    );
  }
}

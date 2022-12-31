import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopwear/UI/CustomWidgets/common_button.dart';
import 'package:shopwear/UI/View/TopWearModule/View_Model/topwearproducts_view_model.dart';
import '../../../../Utils/app_colors.dart';
import '../../../../Utils/common_function.dart';
import '../../../../Utils/common_style.dart';
import '../../../../Utils/drawer.dart';
import '../../../../Utils/string_constants.dart';
import '../../../CustomWidgets/custom_appbar.dart';
import '../../../CustomWidgets/custom_circularprogressindicator.dart';
import '../../../CustomWidgets/custom_gridview.dart';
import '../../AllProductsModule/View/allProducts_screen.dart';
import '../../BottomWearModule/View/bottomProducts_screen.dart';
import '../../TopWearModule/View/topProducts_screen.dart';

class TopWereGridview extends StatefulWidget {
  const TopWereGridview({Key? key}) : super(key: key);

  @override
  State<TopWereGridview> createState() => _TopWereGridviewState();
}

class _TopWereGridviewState extends State<TopWereGridview> {
  final topWereGrid = Get.find<TopWearProductsViewModel>();

  RxInt topSelectedCard = (-1).obs;
  RxBool isTopButtonVisible = false.obs;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    return SafeArea(
      child: Scaffold(
        appBar: commonAppBarImg(context, true),
        drawer: customDrawer(context),
        bottomNavigationBar: Obx(() => Visibility(
              visible: isTopButtonVisible.value,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 44.0, right: 44.0, bottom: 22.0),
                child: commonButton(context, takeTrialBtnTxt.toUpperCase(),
                    () async {
                  final prefs = await SharedPreferences.getInstance();
                  prefs.setInt(keyTopIndex, topSelectedCard.value);
                  print('hellloooo->${prefs.getInt(keyTopIndex)}');
                  print('helllooookeyBottomIndex->${prefs.getInt(keyBottomIndex)}');
                  if(prefs.getInt(keyBottomIndex) != null){
                    if(prefs.getInt(keyBottomIndex)! >= 0){
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AllProductsListing()));
                    }else{
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => BottomProductsListing()));
                    }
                  }else {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => BottomProductsListing()));
                  }
                }),
              ),
            )),
        body: Obx(() => topWereGrid.isLoading == true
            ? commonCircularProgress()
            : topProductsGridView(context, itemWidth, itemHeight, topWereGrid)),
      ),
    );
  }

  Widget topProductsGridView(BuildContext context, double itemWidth,
      double itemHeight, TopWearProductsViewModel topProductsViewModel) {
    print('Length${topProductsViewModel.topProductList.length}');
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: topProductsViewModel.topProductList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:
                MediaQuery.of(context).orientation == Orientation.landscape
                    ? 3
                    : 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: (itemWidth / itemHeight),
          ),
          itemBuilder: (context, index) {
            return Obx(() => GestureDetector(
                  onTap: () {
                    topSelectedCard.value == index
                        ? topSelectedCard.value = -1
                        : topSelectedCard.value = index;
                    topSelectedCard.value == -1
                        ? isTopButtonVisible.value = false
                        : isTopButtonVisible.value = true;
                    print('object---->${topSelectedCard.value}');
                  },
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Visibility(
                          visible:
                              topSelectedCard.value == index ? true : false,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                                decoration: new BoxDecoration(
                                  color: AppColors.bgBlack,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.done_sharp,
                                  color: AppColors.bgWhite,
                                )),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: Container(
                            height: 190.0,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: imageLoader(topProductsViewModel
                                  .topProductList[index].image
                                  .toString()),
                            ),
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10.0, bottom: 5.0, right: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Text(
                                      topProductsViewModel
                                          .topProductList[index].title
                                          .toString(),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Text(
                                    topProductsViewModel
                                        .topProductList[index].price
                                        .toString(),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ));
          },
        ),
      ),
    );
  }
}

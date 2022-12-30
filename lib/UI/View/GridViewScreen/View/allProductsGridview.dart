import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Utils/app_colors.dart';
import '../../../../Utils/common_function.dart';
import '../../../../Utils/drawer.dart';
import '../../../../Utils/string_constants.dart';
import '../../../CustomWidgets/common_button.dart';
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
  RxInt allSelectedCard = (-1).obs;
  RxBool isAllButtonVisible = false.obs;

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
          visible: isAllButtonVisible.value,
          child: Padding(
            padding: const EdgeInsets.only(left: 44.0,right: 44.0,bottom: 22.0),
            child: commonButton(context, takeTrialBtnTxt.toUpperCase(), () { }),
          ),
        )),
          body: Obx(()=>
          allProductsViewModel.isLoading == true ? commonCircularProgress() : allProductsGridView(context,itemWidth,itemHeight, allProductsViewModel)),
      ),
    );
  }
  Widget allProductsGridView(BuildContext context, double itemWidth,
      double itemHeight, AllProductsViewModel allProductsViewModel) {
    print('Length${allProductsViewModel.allProductList.length}');
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: allProductsViewModel.allProductList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:
            MediaQuery.of(context).orientation == Orientation.landscape ? 3 : 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: (itemWidth / itemHeight),
          ),
          itemBuilder: (context, index) {
            return Obx(() => GestureDetector(
              onTap: () {
                allSelectedCard.value == index ? allSelectedCard.value = -1: allSelectedCard.value = index;
                allSelectedCard.value == -1
                    ? isAllButtonVisible.value = false
                    : isAllButtonVisible.value = true;
                print('object---->${allSelectedCard.value}');
              },
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Visibility(
                      visible: allSelectedCard.value == index ? true : false,
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
                          child: imageLoader(allProductsViewModel
                              .allProductList[index].image
                              .toString()),
                        ),
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Padding(
                      padding:
                      EdgeInsets.only(left: 10.0, bottom: 5.0, right: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  allProductsViewModel.allProductList[index].title
                                      .toString(),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Text(
                                allProductsViewModel.allProductList[index].price
                                    .toString(),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontWeight: FontWeight.bold),
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

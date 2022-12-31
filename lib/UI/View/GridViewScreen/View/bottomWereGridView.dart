import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../Utils/app_colors.dart';
import '../../../../Utils/common_function.dart';
import '../../../../Utils/drawer.dart';
import '../../../../Utils/string_constants.dart';
import '../../../CustomWidgets/common_button.dart';
import '../../../CustomWidgets/custom_appbar.dart';
import '../../../CustomWidgets/custom_circularprogressindicator.dart';
import '../../../CustomWidgets/custom_gridview.dart';
import '../../AllProductsModule/View/allProducts_screen.dart';
import '../../BottomWearModule/View_Model/bottomwearproducts_view_model.dart';
import '../../TopWearModule/View/topProducts_screen.dart';

class BottomWereGridview extends StatefulWidget {
  const BottomWereGridview({Key? key}) : super(key: key);

  @override
  State<BottomWereGridview> createState() => _BottomWereGridviewState();
}

class _BottomWereGridviewState extends State<BottomWereGridview> {
  final bottomWereGrid = Get.find<BottomWearProductsViewModel>();
  RxInt bottomSelectedCard = (-1).obs;
  RxBool isBottomButtonVisible = false.obs;

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
              visible: isBottomButtonVisible.value,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 44.0, right: 44.0, bottom: 22.0),
                child:
                    commonButton(context, takeTrialBtnTxt.toUpperCase(), () async {
                      final prefs = await SharedPreferences.getInstance();
                      prefs.setInt(keyBottomIndex, bottomSelectedCard.value);
                      print('hellloooo->${prefs.getInt(keyTopIndex)}');
                      print('helllooookeyBottomIndex->${prefs.getInt(keyBottomIndex)}');
                      if(prefs.getInt(keyTopIndex) != null){
                        if(prefs.getInt(keyTopIndex)! >= 0){
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => AllProductsListing()));
                        }else{
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => TopProductsListing()));
                        }
                      }else {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => TopProductsListing()));
                      }
                    }),
              ),
            )),
        body: Obx(() => bottomWereGrid.isLoading == true
            ? commonCircularProgress()
            : bottomProductsGridView(
                context, itemWidth, itemHeight, bottomWereGrid)),
      ),
    );
  }

  Widget bottomProductsGridView(BuildContext context, double itemWidth,
      double itemHeight, BottomWearProductsViewModel bottomViewModel) {
    print('Length${bottomViewModel.bottomWearList.length}');
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: bottomViewModel.bottomWearList.length,
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
                    bottomSelectedCard.value == index
                        ? bottomSelectedCard.value = -1
                        : bottomSelectedCard.value = index;
                    bottomSelectedCard.value == -1
                        ? isBottomButtonVisible.value = false
                        : isBottomButtonVisible.value = true;
                    print('object---->${bottomSelectedCard.value}');
                  },
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Visibility(
                          visible:
                              bottomSelectedCard.value == index ? true : false,
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
                              child: imageLoader(bottomViewModel
                                  .bottomWearList[index].image
                                  .toString()),
                            ),
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Padding(
                          padding: EdgeInsets.only(
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
                                      bottomViewModel
                                          .bottomWearList[index].title
                                          .toString(),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Text(
                                    bottomViewModel.bottomWearList[index].price
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

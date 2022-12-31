import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopwear/UI/View/AllProductsModule/View_Model/allProducts_view_model.dart';
import 'package:shopwear/UI/View/BottomWearModule/View_Model/bottomwearproducts_view_model.dart';
import 'package:shopwear/Utils/app_colors.dart';
import 'package:shopwear/Utils/common_function.dart';

/*Widget topProductsGridView(BuildContext context, double itemWidth,
    double itemHeight, TopWearProductsViewModel topProductsViewModel) {
  RxInt topSelectedCard = (-1).obs;
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
                  topSelectedCard.value == index ? topSelectedCard.value = -1: topSelectedCard.value = index;
                  print('object---->${topSelectedCard.value}');
                },
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Visibility(
                        visible: topSelectedCard.value == index ? true : false,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  topProductsViewModel.topProductList[index].price
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
}*/

/*Widget bottomProductsGridView(BuildContext context, double itemWidth,
    double itemHeight, BottomWearProductsViewModel bottomViewModel) {
  RxInt bottomSelectedCard = (-1).obs;
  print('Length${bottomViewModel.bottomWearList.length}');
  return SafeArea(
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: bottomViewModel.bottomWearList.length,
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
              bottomSelectedCard.value == index ? bottomSelectedCard.value = -1: bottomSelectedCard.value = index;
              print('object---->${bottomSelectedCard.value}');
            },
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Visibility(
                    visible: bottomSelectedCard.value == index ? true : false,
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
                                bottomViewModel.bottomWearList[index].title
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
}*/

/*Widget allProductsGridView(BuildContext context, double itemWidth,
    double itemHeight, AllProductsViewModel allProductsViewModel) {
  RxInt allSelectedCard = (-1).obs;
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
}*/

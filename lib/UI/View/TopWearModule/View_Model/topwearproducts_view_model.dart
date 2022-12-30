import 'package:get/get.dart';

import '../../../../Data/Remote/Response/topwear_model_response.dart';
import '../../../../Network/Repository/topwear_repository.dart';

class TopWearProductsViewModel extends FullLifeCycleController {
  var allProductList = <TopWearModel>[].obs;
  var isLoading = true.obs;
  var onError = false.obs;

  @override
  void onInit() {
    super.onInit();
    getTopWear();
  }

  Future<void> getTopWear() async {
    var topWearProducts = await TopWearProductsRepository.fetchAllData();

    if (topWearProducts != null) {
      isLoading.value = false;
      allProductList.value = topWearProducts;
    } else {
      isLoading.value = false;
      onError.value = true;
    }
  }
}

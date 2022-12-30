import 'package:get/get.dart';

import '../../../../Data/Remote/Response/topwear_model_response.dart';
import '../../../../Network/Repository/topwear_repository.dart';

class TopWearProductsViewModel extends FullLifeCycleController {
  var topProductList = <TopWearModel>[].obs;
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
      topProductList.value = topWearProducts;
    } else {
      isLoading.value = false;
      onError.value = true;
    }
  }
}

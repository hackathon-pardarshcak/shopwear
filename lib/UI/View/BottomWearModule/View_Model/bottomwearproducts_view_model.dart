import 'package:get/get.dart';
import '../../../../Data/Remote/Response/bottomwear_model_response.dart';
import '../../../../Network/Repository/bottomwear_repository.dart';

class BottomWearProductsViewModel extends FullLifeCycleController {
  var bottomWearList = <BottomWearModel>[].obs;
  var isLoading = true.obs;
  var onError = false.obs;

  @override
  void onInit() {
    super.onInit();
    getTopWear();
  }

  Future<void> getTopWear() async {
    var bottomWearProducts = await BottomWearProductsRepository.fetchAllData();

    if (bottomWearProducts != null) {
      isLoading.value = false;
      bottomWearList.value = bottomWearProducts;
    } else {
      isLoading.value = false;
      onError.value = true;
    }
  }
}

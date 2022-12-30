import 'package:get/get.dart';
import '../../../../Data/Remote/Response/allproducts_model_response.dart';
import '../../../../Network/Repository/allproducts_repository.dart';

class AllProductsViewModel extends FullLifeCycleController {
  var allProductList = <AllProductsModel>[].obs;
  var isLoading = true.obs;
  var onError = false.obs;

  @override
  void onInit() {
    super.onInit();
    getAllUsers();
  }

  Future<void> getAllUsers() async {
    var allProducts = await AllProductsRepository.fetchAllData();

    if (allProducts != null) {
      isLoading.value = false;
      allProductList.value = allProducts;
    } else {
      isLoading.value = false;
      onError.value = true;
    }
  }
}

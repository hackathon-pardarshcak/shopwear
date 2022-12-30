import 'package:get/get.dart';
import '../../Config/Services/network_manager.dart';
import '../../UI/View/AllProductsModule/View_Model/allproducts_view_model.dart';
import '../../UI/View/BottomWearModule/View_Model/bottomwearproducts_view_model.dart';
import '../../UI/View/TopWearModule/View_Model/topwearproducts_view_model.dart';

class NetworkBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetXNetworkManager>(() => GetXNetworkManager());
    Get.lazyPut<AllProductsViewModel>(() => AllProductsViewModel(), fenix: true);
    Get.lazyPut<TopWearProductsViewModel>(() => TopWearProductsViewModel(), fenix: true);
    Get.lazyPut<BottomWearProductsViewModel>(() => BottomWearProductsViewModel(), fenix: true);
  }
}

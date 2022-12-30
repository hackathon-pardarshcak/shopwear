import 'package:get/get.dart';
import 'package:getxdemo/UI/View/UserModule/View_Model/user_view_model.dart';
import '../../Config/Services/network_manager.dart';
import '../../UI/View/FlightModule/View_module/flight_view_model.dart';

class NetworkBinding extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut<GetXNetworkManager>(() => GetXNetworkManager());
    Get.lazyPut<UserViewModel>(() => UserViewModel(),fenix: true);
    Get.lazyPut<FlightViewModel>(() => FlightViewModel(),fenix: true);
  }
}
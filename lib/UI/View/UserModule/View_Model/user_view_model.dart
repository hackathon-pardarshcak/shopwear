import 'package:get/get.dart';
import '../../../../Data/Remote/Response/user_model_response.dart';
import '../../../../Network/Repository/user_repository.dart';

class UserViewModel extends FullLifeCycleController {

  var userList = <UserModel>[].obs;
  var isLoading = true.obs;
  var onError = false.obs;

  @override
  void onInit() {
    super.onInit();
    getAllUsers();
  }

  Future<void> getAllUsers() async {
    var user = await UserRepository.fetchAllData();

    if (user != null) {
      isLoading.value = false;
      userList.value = user;
    } else {
      isLoading.value = false;
      onError.value = true;
    }
  }
}
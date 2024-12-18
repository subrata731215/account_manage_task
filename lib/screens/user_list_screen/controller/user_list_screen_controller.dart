import 'package:get/get.dart';
import '../../../hive_services/hive_services.dart';
import '../../../model/user_hive_model.dart';

class UserListScreenController extends GetxController {
  final registerUserList = <UserHiveModel>[].obs;

  Future<void> updateUserList() async {
    registerUserList.value = await HiveServices().getUser();
  }

  void deleteUser(UserHiveModel userModel) async {
    var index = (await HiveServices().getUser()).indexOf(userModel);
    HiveServices().deleteUserAt(index);
    updateUserList();
    Get.snackbar('User Delete Successful', 'Thank You!');
  }
}
